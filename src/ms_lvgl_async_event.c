/*
 * Copyright (c) 2015-2021 ACOINFO Co., Ltd.
 * All rights reserved.
 *
 * Detailed license information can be found in the LICENSE file.
 *
 * File: ms_lvgl_async_event.c LVGL async event handler.
 *
 * Author: Jiao.jinxing <jiaojinxing@acoinfo.com>
 *
 */

#include <ms_rtos.h>
#include "lvgl/lvgl.h"
#include "ms_lvgl_async_event.h"

typedef struct {
    lv_obj_t   *obj;
    lv_event_t  event;
    const void *data;
} ms_lvgl_async_event_t;

static ms_handle_t           ms_lvgl_mqueueid;
static ms_lvgl_async_event_t ms_lvgl_mqueue_buf[5];

ms_err_t ms_lvgl_async_event_init(void)
{
    return ms_mqueue_create("lvgl_async_mq", ms_lvgl_mqueue_buf, MS_ARRAY_SIZE(ms_lvgl_mqueue_buf), sizeof(ms_lvgl_async_event_t),
                            MS_WAIT_TYPE_PRIO, &ms_lvgl_mqueueid);
}

ms_err_t ms_lvgl_async_event_handler(ms_uint32_t ms)
{
    ms_lvgl_async_event_t evt;
    ms_err_t err = ms_mqueue_recv(ms_lvgl_mqueueid, &evt, ms_time_ms_to_tick(ms));

    if (err == MS_ERR_NONE) {
        lv_event_send(evt.obj, evt.event, evt.data);
    }

    return err;
}

ms_err_t ms_lvgl_async_event_send(lv_obj_t *obj, lv_event_t event, const void *data)
{
    ms_lvgl_async_event_t evt;

    evt.obj = obj;
    evt.event = event;
    evt.data = data;

    return ms_mqueue_send(ms_lvgl_mqueueid, &evt, MS_TIMEOUT_FOREVER);
}
