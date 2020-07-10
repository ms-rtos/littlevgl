/*
 * Copyright (c) 2015-2020 ACOINFO Co., Ltd.
 * All rights reserved.
 *
 * Detailed license information can be found in the LICENSE file.
 *
 * File: ms_lvgl_indev.c LittleVGL input device porting.
 *
 * Author: Jiao.jinxing <jiaojixing@acoinfo.com>
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

static void touchpad_init(void);
static bool touchpad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data);

/**********************
 *  STATIC VARIABLES
 **********************/

static lv_indev_t * ms_lvgl_touch_indev;
static int          ms_lvgl_touch_fd;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void lv_port_indev_init(void)
{
    /* Here you will find example implementation of input devices supported by LittelvGL:
     *  - Touchpad
     *  - Mouse (with cursor support)
     *  - Keypad (supports GUI usage only with key)
     *  - Encoder (supports GUI usage only with: left, right, push)
     *  - Button (external buttons to press points on the screen)
     *
     *  The `..._read()` function are only examples.
     *  You should shape them according to your hardware
     */

    lv_indev_drv_t indev_drv;

    /*------------------
     * Touchpad
     * -----------------*/

    /*Initialize your touchpad if you have*/
    touchpad_init();

    /*Register a touchpad input device*/
    lv_indev_drv_init(&indev_drv);
    indev_drv.type = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = touchpad_read;
    ms_lvgl_touch_indev = lv_indev_drv_register(&indev_drv);
}

/**********************
 *   STATIC FUNCTIONS
 **********************/

/*------------------
 * Touchpad
 * -----------------*/

/*Initialize your touchpad*/
static void touchpad_init(void)
{
    ms_lvgl_touch_fd = ms_io_open("/dev/touch0", O_RDONLY, 0666);
    if (ms_lvgl_touch_fd < 0) {
        ms_printf("Failed to open /dev/touch0 device!\n");
        abort();
    }

    ms_io_fcntl(ms_lvgl_touch_fd, F_SETFL, FNONBLOCK);
}

/* Will be called by the library to read the touchpad */
static bool touchpad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
{
    /* Read your touchpad */
    static int16_t last_x = 0;
    static int16_t last_y = 0;
    ms_touch_event_t event;

    if (ms_io_read(ms_lvgl_touch_fd, &event, sizeof(event)) == sizeof(event)) {
        if (event.touch_detected > 0) {
            data->point.x = event.touch_x[0];
            data->point.y = event.touch_y[0];
            last_x = data->point.x;
            last_y = data->point.y;
            data->state = LV_INDEV_STATE_PR;
        } else {
            data->point.x = last_x;
            data->point.y = last_y;
            data->state = LV_INDEV_STATE_REL;
        }
    }

    return false;   /*false: no more data to read because we are no buffering*/
}
