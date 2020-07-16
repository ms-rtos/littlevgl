/*
 * Copyright (c) 2015-2020 ACOINFO Co., Ltd.
 * All rights reserved.
 *
 * Detailed license information can be found in the LICENSE file.
 *
 * File: ms_lvgl_display.c LittleVGL display porting.
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

/**********************
 *  STATIC PROTOTYPES
 **********************/

static void disp_init(void);

static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p);
#if LV_USE_GPU
static void gpu_blend(struct _disp_drv_t * disp_drv, lv_color_t * dest, const lv_color_t * src, uint32_t length, lv_opa_t opa);
static void gpu_fill(struct _disp_drv_t * disp_drv, lv_color_t * dest_buf, lv_coord_t dest_width, const lv_area_t * fill_area, lv_color_t color);
#endif

/**********************
 *  STATIC VARIABLES
 **********************/

static int                    ms_lvgl_fb_fd;
static ms_fb_var_screeninfo_t ms_lvgl_fb_var_info;
static ms_fb_fix_screeninfo_t ms_lvgl_fb_fix_info;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void lv_port_disp_init(void)
{
    /*-------------------------
     * Initialize your display
     * -----------------------*/
    disp_init();

    /*-----------------------------
     * Create a buffer for drawing
     *----------------------------*/

    /* LittlevGL requires a buffer where it draws the objects. The buffer's has to be greater than 1 display row
     *
     * There are three buffering configurations:
     * 1. Create ONE buffer with some rows:
     *      LittlevGL will draw the display's content here and writes it to your display
     *
     * 2. Create TWO buffer with some rows:
     *      LittlevGL will draw the display's content to a buffer and writes it your display.
     *      You should use DMA to write the buffer's content to the display.
     *      It will enable LittlevGL to draw the next part of the screen to the other buffer while
     *      the data is being sent form the first buffer. It makes rendering and flushing parallel.
     *
     * 3. Create TWO screen-sized buffer:
     *      Similar to 2) but the buffer have to be screen sized. When LittlevGL is ready it will give the
     *      whole frame to display. This way you only need to change the frame buffer's address instead of
     *      copying the pixels.
     */

    static lv_disp_buf_t disp_buf_2;
    static lv_color_t buf2_1[LV_HOR_RES_MAX * 10];                        /*A buffer for 10 rows*/
    static lv_color_t buf2_2[LV_HOR_RES_MAX * 10];                        /*An other buffer for 10 rows*/
    lv_disp_buf_init(&disp_buf_2, buf2_1, buf2_2, LV_HOR_RES_MAX * 10);   /*Initialize the display buffer*/

    /*-----------------------------------
     * Register the display in LittlevGL
     *----------------------------------*/

    lv_disp_drv_t disp_drv;                         /*Descriptor of a display driver*/
    lv_disp_drv_init(&disp_drv);                    /*Basic initialization*/

    /*Set up the functions to access to your display*/

    /*Set the resolution of the display*/
    disp_drv.hor_res = ms_lvgl_fb_var_info.xres;
    disp_drv.ver_res = ms_lvgl_fb_var_info.yres;

    /*Used to copy the buffer's content to the display*/
    disp_drv.flush_cb = disp_flush;

    /*Set a display buffer*/
    disp_drv.buffer = &disp_buf_2;

#if LV_USE_GPU
    /*Optionally add functions to access the GPU. (Only in buffered mode, LV_VDB_SIZE != 0)*/

    /*Blend two color array using opacity*/
    disp_drv.gpu_blend_cb = gpu_blend;

    /*Fill a memory array with a color*/
    disp_drv.gpu_fill_cb = gpu_fill;
#endif

    /*Finally register the driver*/
    lv_disp_drv_register(&disp_drv);
}

/**********************
 *   STATIC FUNCTIONS
 **********************/

/* Initialize your display and the required peripherals. */
static void disp_init(void)
{
    ms_lvgl_fb_fd = ms_io_open("/dev/fb0", O_RDWR, 0666);
    if (ms_lvgl_fb_fd < 0) {
        ms_printf("Failed to open /dev/fb0 device!\n");
        abort();
    }

    if (ms_io_ioctl(ms_lvgl_fb_fd, MS_FB_CMD_GET_VSCREENINFO, &ms_lvgl_fb_var_info) < 0) {
        ms_printf("Failed to get /dev/fb0 variable screen info!\n");
        abort();
    }

    if (ms_io_ioctl(ms_lvgl_fb_fd, MS_FB_CMD_GET_FSCREENINFO, &ms_lvgl_fb_fix_info) < 0) {
        ms_printf("Failed to get /dev/fb0 fix screen info!\n");
        abort();
    }
}

/* Flush the content of the internal buffer the specific area on the display
 * You can use DMA or any hardware acceleration to do this operation in the background but
 * 'lv_disp_flush_ready()' has to be called when finished. */
static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p)
{
    int32_t y;
    lv_color_t *ptr;
    int32_t len = (area->x2 - area->x1 + 1) * sizeof(lv_color_t);

    ptr = (lv_color_t *)(ms_lvgl_fb_fix_info.smem_start + \
                         area->y1 * ms_lvgl_fb_fix_info.line_length + \
                         area->x1 * sizeof(lv_color_t));

    for(y = area->y1; y <= area->y2; y++) {
        memcpy(ptr, color_p, len);
        ptr = (lv_color_t *)((char *)ptr + ms_lvgl_fb_fix_info.line_length);
        color_p = (lv_color_t *)((char *)color_p + len);
    }

    /* IMPORTANT!!!
     * Inform the graphics library that you are ready with the flushing*/
    lv_disp_flush_ready(disp_drv);
}

/*OPTIONAL: GPU INTERFACE*/
#if LV_USE_GPU

/* If your MCU has hardware accelerator (GPU) then you can use it to blend to memories using opacity
 * It can be used only in buffered mode (LV_VDB_SIZE != 0 in lv_conf.h)*/
static void gpu_blend(lv_disp_drv_t * disp_drv, lv_color_t * dest, const lv_color_t * src, uint32_t length, lv_opa_t opa)
{
    uint32_t i;

    for(i = 0; i < length; i++) {
        dest[i] = lv_color_mix(dest[i], src[i], opa);
    }
}

/* If your MCU has hardware accelerator (GPU) then you can use it to fill a memory with a color
 * It can be used only in buffered mode (LV_VDB_SIZE != 0 in lv_conf.h)*/
static void gpu_fill(lv_disp_drv_t * disp_drv, lv_color_t * dest_buf, lv_coord_t dest_width,
                     const lv_area_t * fill_area, lv_color_t color)
{
    uint32_t x, y;

    dest_buf += dest_width * fill_area->y1; /*Go to the first line*/

    for(y = fill_area->y1; y < fill_area->y2; y++) {
        for(x = fill_area->x1; x < fill_area->x2; x++) {
            dest_buf[x] = color;
        }
        dest_buf+=dest_width;    /*Go to the next line*/
    }
}

#endif  /*LV_USE_GPU*/
