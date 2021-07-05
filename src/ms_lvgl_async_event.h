/*
 * Copyright (c) 2015-2021 ACOINFO Co., Ltd.
 * All rights reserved.
 *
 * Detailed license information can be found in the LICENSE file.
 *
 * File: ms_lvgl_async_event.h LVGL async event handler.
 *
 * Author: Jiao.jinxing <jiaojinxing@acoinfo.com>
 *
 */

#ifndef MS_LVGL_ASYNC_EVENT_H
#define MS_LVGL_ASYNC_EVENT_H

#ifdef __cplusplus
extern "C" {
#endif

ms_err_t ms_lvgl_async_event_init(void);
ms_err_t ms_lvgl_async_event_handler(ms_uint32_t ms);
ms_err_t ms_lvgl_async_event_send(lv_obj_t *obj, lv_event_t event, const void *data);

#ifdef __cplusplus
}
#endif

#endif /* MS_LVGL_ASYNC_EVENT_H */
