/*
 * Copyright (c) 2015-2020 ACOINFO Co., Ltd.
 * All rights reserved.
 *
 * Detailed license information can be found in the LICENSE file.
 *
 * File: ms_lvgl_fs.c LittleVGL file system porting.
 *
 * Author: Jiao.jinxing <jiaojinxing@acoinfo.com>
 *
 */

/*********************
 *      INCLUDES
 *********************/

#include <ms_rtos.h>

#include "lv_conf.h"
#include "lvgl/lvgl.h"

#include <string.h>
#include <stdlib.h>

/*********************
 *      DEFINES
 *********************/

/**********************
 *      TYPEDEFS
 **********************/

typedef struct {
    int fd;
} file_t;

typedef struct {
    MS_DIR *dir;
} dir_t;

/**********************
 *  STATIC PROTOTYPES
 **********************/

static bool fs_ready (struct _lv_fs_drv_t * drv);
static lv_fs_res_t fs_open (lv_fs_drv_t * drv, void * file_p, const char * path, lv_fs_mode_t mode);
static lv_fs_res_t fs_close (lv_fs_drv_t * drv, void * file_p);
static lv_fs_res_t fs_read (lv_fs_drv_t * drv, void * file_p, void * buf, uint32_t btr, uint32_t * br);
static lv_fs_res_t fs_write(lv_fs_drv_t * drv, void * file_p, const void * buf, uint32_t btw, uint32_t * bw);
static lv_fs_res_t fs_seek (lv_fs_drv_t * drv, void * file_p, uint32_t pos);
static lv_fs_res_t fs_size (lv_fs_drv_t * drv, void * file_p, uint32_t * size_p);
static lv_fs_res_t fs_tell (lv_fs_drv_t * drv, void * file_p, uint32_t * pos_p);
static lv_fs_res_t fs_remove (lv_fs_drv_t * drv, const char *path);
static lv_fs_res_t fs_trunc (lv_fs_drv_t * drv, void * file_p);
static lv_fs_res_t fs_rename (lv_fs_drv_t * drv, const char * oldname, const char * newname);
static lv_fs_res_t fs_free_space (lv_fs_drv_t * drv, uint32_t * total_p, uint32_t * free_p);
static lv_fs_res_t fs_dir_open (lv_fs_drv_t * drv, void * rddir_p, const char *path);
static lv_fs_res_t fs_dir_read (lv_fs_drv_t * drv, void * rddir_p, char *fn);
static lv_fs_res_t fs_dir_close (lv_fs_drv_t * drv, void * rddir_p);

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 * GLOBAL PROTOTYPES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void lv_port_fs_init(void)
{
    /*---------------------------------------------------
     * Register the file system interface  in LittlevGL
     *--------------------------------------------------*/

    lv_fs_drv_t fs_drv;                         /*A driver descriptor*/
    lv_fs_drv_init(&fs_drv);

    /*Set up fields...*/
    fs_drv.letter = 'P';
    fs_drv.file_size = sizeof(file_t);
    fs_drv.rddir_size = sizeof(dir_t);

    fs_drv.ready_cb = fs_ready;
    fs_drv.open_cb = fs_open;
    fs_drv.close_cb = fs_close;
    fs_drv.remove_cb = fs_remove;
    fs_drv.read_cb = fs_read;
    fs_drv.write_cb = fs_write;
    fs_drv.seek_cb = fs_seek;
    fs_drv.tell_cb = fs_tell;
    fs_drv.trunc_cb = fs_trunc;
    fs_drv.size_cb = fs_size;
    fs_drv.rename_cb = fs_rename;
    fs_drv.free_space_cb = fs_free_space;

    fs_drv.dir_open_cb = fs_dir_open;
    fs_drv.dir_read_cb = fs_dir_read;
    fs_drv.dir_close_cb = fs_dir_close;

    lv_fs_drv_register(&fs_drv);
}

/**********************
 *   STATIC FUNCTIONS
 **********************/

static lv_fs_res_t ms_errno_to_lv_fs_res(int err)
{
    lv_fs_res_t res;

    switch (err) {
    case 0:
        res = LV_FS_RES_OK;
        break;

    case EIO:
        res = LV_FS_RES_HW_ERR;
        break;

    case EFAULT:
        res = LV_FS_RES_FS_ERR;
        break;

    case ENOENT:
        res = LV_FS_RES_NOT_EX;
        break;

    case ENOSPC:
        res = LV_FS_RES_FULL;
        break;

    case EBUSY:
        res = LV_FS_RES_LOCKED;
        break;

    case EPERM:
    case EACCES:
        res = LV_FS_RES_DENIED;
        break;

    case ETIME:
    case ETIMEDOUT:
        res = LV_FS_RES_TOUT;
        break;

    case ENOTSUP:
    case ENOSYS:
        res = LV_FS_RES_NOT_IMP;
        break;

    case ENOMEM:
        res = LV_FS_RES_OUT_OF_MEM;
        break;

    case EINVAL:
        res = LV_FS_RES_INV_PARAM;
        break;

    default:
        res = LV_FS_RES_UNKNOWN;
        break;
    }

    return res;
}

static bool fs_ready (struct _lv_fs_drv_t * drv)
{
    return true;
}

/**
 * Open a file
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to a file_t variable
 * @param path path to the file beginning with the driver letter (e.g. S:/folder/file.txt)
 * @param mode read: FS_MODE_RD, write: FS_MODE_WR, both: FS_MODE_RD | FS_MODE_WR
 * @return LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_open (lv_fs_drv_t * drv, void * file_p, const char * path, lv_fs_mode_t mode)
{
    lv_fs_res_t res;
    file_t *file = file_p;
    int oflag;

    if (mode == LV_FS_MODE_WR) {
        oflag = O_WRONLY;
    } else if (mode == LV_FS_MODE_RD) {
        oflag = O_RDONLY;
    } else if (mode == (LV_FS_MODE_WR | LV_FS_MODE_RD)) {
        oflag = O_RDWR;
    } else {
        oflag = O_RDONLY;
    }

    file->fd = ms_io_open(path, oflag, 0666);
    if (file->fd < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Close an opened file
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to a file_t variable. (opened with lv_ufs_open)
 * @return LV_FS_RES_OK: no error, the file is read
 *         any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_close (lv_fs_drv_t * drv, void * file_p)
{
    lv_fs_res_t res;
    file_t *file = file_p;

    if (ms_io_close(file->fd) < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Read data from an opened file
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to a file_t variable.
 * @param buf pointer to a memory block where to store the read data
 * @param btr number of Bytes To Read
 * @param br the real number of read bytes (Byte Read)
 * @return LV_FS_RES_OK: no error, the file is read
 *         any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_read (lv_fs_drv_t * drv, void * file_p, void * buf, uint32_t btr, uint32_t * br)
{
    lv_fs_res_t res;
    file_t *file = file_p;
    ms_ssize_t len;

    len = ms_io_read(file->fd, buf, btr);
    if (len < 0) {
        *br = 0;
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        *br = len;
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Write into a file
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to a file_t variable
 * @param buf pointer to a buffer with the bytes to write
 * @param btr Bytes To Write
 * @param br the number of real written bytes (Bytes Written). NULL if unused.
 * @return LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_write(lv_fs_drv_t * drv, void * file_p, const void * buf, uint32_t btw, uint32_t * bw)
{
    lv_fs_res_t res;
    file_t *file = file_p;
    ms_ssize_t len;

    len = ms_io_write(file->fd, buf, btw);
    if (len < 0) {
        *bw = 0;
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        *bw = len;
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Set the read write pointer. Also expand the file size if necessary.
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to a file_t variable. (opened with lv_ufs_open )
 * @param pos the new position of read write pointer
 * @return LV_FS_RES_OK: no error, the file is read
 *         any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_seek (lv_fs_drv_t * drv, void * file_p, uint32_t pos)
{
    lv_fs_res_t res;
    file_t *file = file_p;

    if (ms_io_lseek(file->fd, pos, SEEK_SET) < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Give the size of a file bytes
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to a file_t variable
 * @param size pointer to a variable to store the size
 * @return LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_size (lv_fs_drv_t * drv, void * file_p, uint32_t * size_p)
{
    lv_fs_res_t res;
    file_t *file = file_p;
    ms_stat_t st;

    if (ms_io_fstat(file->fd, &st) < 0) {
        *size_p = 0;
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        *size_p = st.st_size;
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Give the position of the read write pointer
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to a file_t variable.
 * @param pos_p pointer to to store the result
 * @return LV_FS_RES_OK: no error, the file is read
 *         any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_tell (lv_fs_drv_t * drv, void * file_p, uint32_t * pos_p)
{
    lv_fs_res_t res;
    file_t *file = file_p;
    ms_off_t off;

    off = ms_io_tell(file->fd);
    if (off < 0) {
        *pos_p = 0;
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        *pos_p = off;
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Delete a file
 * @param drv pointer to a driver where this function belongs
 * @param path path of the file to delete
 * @return  LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_remove (lv_fs_drv_t * drv, const char * path)
{
    lv_fs_res_t res;

    if (ms_io_unlink(path) < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Truncate the file size to the current position of the read write pointer
 * @param drv pointer to a driver where this function belongs
 * @param file_p pointer to an 'ufs_file_t' variable. (opened with lv_fs_open )
 * @return LV_FS_RES_OK: no error, the file is read
 *         any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_trunc (lv_fs_drv_t * drv, void * file_p)
{
    lv_fs_res_t res;
    file_t *file = file_p;

    if (ms_io_ftruncate(file->fd, ms_io_tell(file->fd)) < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Rename a file
 * @param drv pointer to a driver where this function belongs
 * @param oldname path to the file
 * @param newname path with the new name
 * @return LV_FS_RES_OK or any error from 'fs_res_t'
 */
static lv_fs_res_t fs_rename (lv_fs_drv_t * drv, const char * oldname, const char * newname)
{
    lv_fs_res_t res;

    if (ms_io_rename(oldname, newname) < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Get the free and total size of a driver in kB
 * @param drv pointer to a driver where this function belongs
 * @param letter the driver letter
 * @param total_p pointer to store the total size [kB]
 * @param free_p pointer to store the free size [kB]
 * @return LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_free_space (struct _lv_fs_drv_t * drv, uint32_t * total_p, uint32_t * free_p)
{
    lv_fs_res_t res;
    ms_statvfs_t st;

    if (ms_io_statvfs(".", &st) < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        *total_p = st.f_bsize * st.f_blocks / 1024U;
        *free_p  = st.f_bsize * st.f_bfree / 1024U;
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Initialize a 'fs_read_dir_t' variable for directory reading
 * @param drv pointer to a driver where this function belongs
 * @param rddir_p pointer to a 'fs_read_dir_t' variable
 * @param path path to a directory
 * @return LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_dir_open (lv_fs_drv_t * drv, void * rddir_p, const char * path)
{
    lv_fs_res_t res;
    dir_t *dir = rddir_p;

    dir->dir = ms_io_opendir(path);
    if (dir->dir == MS_NULL) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Read the next filename form a directory.
 * The name of the directories will begin with '/'
 * @param drv pointer to a driver where this function belongs
 * @param rddir_p pointer to an initialized 'fs_read_dir_t' variable
 * @param fn pointer to a buffer to store the filename
 * @return LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_dir_read (lv_fs_drv_t * drv, void * rddir_p, char * fn)
{
    lv_fs_res_t res;
    dir_t *dir = rddir_p;
    ms_dirent_t dirent;
    ms_dirent_t *result;
    int ret;

    ret = ms_io_readdir_r(dir->dir, &dirent, &result);
    if (ret < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else if (result == MS_NULL) {
        res = LV_FS_RES_FS_ERR;
    } else {
        strcpy(fn, result->d_name);
        res = LV_FS_RES_OK;
    }

    return res;
}

/**
 * Close the directory reading
 * @param drv pointer to a driver where this function belongs
 * @param rddir_p pointer to an initialized 'fs_read_dir_t' variable
 * @return LV_FS_RES_OK or any error from lv_fs_res_t enum
 */
static lv_fs_res_t fs_dir_close (lv_fs_drv_t * drv, void * rddir_p)
{
    lv_fs_res_t res;
    dir_t *dir = rddir_p;

    if (ms_io_closedir(dir->dir) < 0) {
        res = ms_errno_to_lv_fs_res(ms_thread_get_errno());
    } else {
        res = LV_FS_RES_OK;
    }

    return res;
}
