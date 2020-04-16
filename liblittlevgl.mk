#*********************************************************************************************************
#
#                                 北京翼辉信息技术有限公司
#
#                                   微型安全实时操作系统
#
#                                       MS-RTOS(TM)
#
#                               Copyright All Rights Reserved
#
#--------------文件信息--------------------------------------------------------------------------------
#
# 文   件   名: liblittlevgl.mk
#
# 创   建   人: IoT Studio
#
# 文件创建日期: 2016 年 10 月 08 日
#
# 描        述: 本文件由 IoT Studio 生成，用于配置 Makefile 功能，请勿手动修改
#*********************************************************************************************************

#*********************************************************************************************************
# Clear setting
#*********************************************************************************************************
include $(CLEAR_VARS_MK)

#*********************************************************************************************************
# Target
#*********************************************************************************************************
LOCAL_TARGET_NAME := liblittlevgl.a

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS := \
./src/lvgl/src/lv_core/lv_disp.c \
./src/lvgl/src/lv_core/lv_group.c \
./src/lvgl/src/lv_core/lv_indev.c \
./src/lvgl/src/lv_core/lv_obj.c \
./src/lvgl/src/lv_core/lv_refr.c \
./src/lvgl/src/lv_core/lv_style.c \
./src/lvgl/src/lv_draw/lv_draw.c \
./src/lvgl/src/lv_draw/lv_draw_arc.c \
./src/lvgl/src/lv_draw/lv_draw_basic.c \
./src/lvgl/src/lv_draw/lv_draw_img.c \
./src/lvgl/src/lv_draw/lv_draw_label.c \
./src/lvgl/src/lv_draw/lv_draw_line.c \
./src/lvgl/src/lv_draw/lv_draw_rect.c \
./src/lvgl/src/lv_draw/lv_draw_triangle.c \
./src/lvgl/src/lv_draw/lv_img_cache.c \
./src/lvgl/src/lv_draw/lv_img_decoder.c \
./src/lvgl/src/lv_font/lv_font.c \
./src/lvgl/src/lv_font/lv_font_fmt_txt.c \
./src/lvgl/src/lv_font/lv_font_roboto_12.c \
./src/lvgl/src/lv_font/lv_font_roboto_16.c \
./src/lvgl/src/lv_font/lv_font_roboto_22.c \
./src/lvgl/src/lv_font/lv_font_roboto_28.c \
./src/lvgl/src/lv_font/lv_font_unscii_8.c \
./src/lvgl/src/lv_hal/lv_hal_disp.c \
./src/lvgl/src/lv_hal/lv_hal_indev.c \
./src/lvgl/src/lv_hal/lv_hal_tick.c \
./src/lvgl/src/lv_misc/lv_anim.c \
./src/lvgl/src/lv_misc/lv_area.c \
./src/lvgl/src/lv_misc/lv_async.c \
./src/lvgl/src/lv_misc/lv_circ.c \
./src/lvgl/src/lv_misc/lv_color.c \
./src/lvgl/src/lv_misc/lv_fs.c \
./src/lvgl/src/lv_misc/lv_gc.c \
./src/lvgl/src/lv_misc/lv_ll.c \
./src/lvgl/src/lv_misc/lv_log.c \
./src/lvgl/src/lv_misc/lv_math.c \
./src/lvgl/src/lv_misc/lv_mem.c \
./src/lvgl/src/lv_misc/lv_task.c \
./src/lvgl/src/lv_misc/lv_templ.c \
./src/lvgl/src/lv_misc/lv_txt.c \
./src/lvgl/src/lv_misc/lv_utils.c \
./src/lvgl/src/lv_objx/lv_arc.c \
./src/lvgl/src/lv_objx/lv_bar.c \
./src/lvgl/src/lv_objx/lv_btn.c \
./src/lvgl/src/lv_objx/lv_btnm.c \
./src/lvgl/src/lv_objx/lv_calendar.c \
./src/lvgl/src/lv_objx/lv_canvas.c \
./src/lvgl/src/lv_objx/lv_cb.c \
./src/lvgl/src/lv_objx/lv_chart.c \
./src/lvgl/src/lv_objx/lv_cont.c \
./src/lvgl/src/lv_objx/lv_ddlist.c \
./src/lvgl/src/lv_objx/lv_gauge.c \
./src/lvgl/src/lv_objx/lv_img.c \
./src/lvgl/src/lv_objx/lv_imgbtn.c \
./src/lvgl/src/lv_objx/lv_kb.c \
./src/lvgl/src/lv_objx/lv_label.c \
./src/lvgl/src/lv_objx/lv_led.c \
./src/lvgl/src/lv_objx/lv_line.c \
./src/lvgl/src/lv_objx/lv_list.c \
./src/lvgl/src/lv_objx/lv_lmeter.c \
./src/lvgl/src/lv_objx/lv_mbox.c \
./src/lvgl/src/lv_objx/lv_objx_templ.c \
./src/lvgl/src/lv_objx/lv_page.c \
./src/lvgl/src/lv_objx/lv_preload.c \
./src/lvgl/src/lv_objx/lv_roller.c \
./src/lvgl/src/lv_objx/lv_slider.c \
./src/lvgl/src/lv_objx/lv_spinbox.c \
./src/lvgl/src/lv_objx/lv_sw.c \
./src/lvgl/src/lv_objx/lv_ta.c \
./src/lvgl/src/lv_objx/lv_table.c \
./src/lvgl/src/lv_objx/lv_tabview.c \
./src/lvgl/src/lv_objx/lv_tileview.c \
./src/lvgl/src/lv_objx/lv_win.c \
./src/lvgl/src/lv_themes/lv_theme.c \
./src/lvgl/src/lv_themes/lv_theme_alien.c \
./src/lvgl/src/lv_themes/lv_theme_default.c \
./src/lvgl/src/lv_themes/lv_theme_material.c \
./src/lvgl/src/lv_themes/lv_theme_mono.c \
./src/lvgl/src/lv_themes/lv_theme_nemo.c \
./src/lvgl/src/lv_themes/lv_theme_night.c \
./src/lvgl/src/lv_themes/lv_theme_templ.c \
./src/lvgl/src/lv_themes/lv_theme_zen.c \
./src/ms_lvgl_display.c \
./src/ms_lvgl_indev.c \
./src/ms_lvgl_fs.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your hearder files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := 

#*********************************************************************************************************
# Pre-defined macro (eg. -DYOUR_MARCO=1)
#*********************************************************************************************************
LOCAL_DSYMBOL := 

#*********************************************************************************************************
# Depend library (eg. LOCAL_DEPEND_LIB := -la LOCAL_DEPEND_LIB_PATH := -L"Your library search path")
#*********************************************************************************************************
LOCAL_DEPEND_LIB      := 
LOCAL_DEPEND_LIB_PATH := 

#*********************************************************************************************************
# C++ config
#*********************************************************************************************************
LOCAL_USE_CXX        := no
LOCAL_USE_CXX_EXCEPT := no

#*********************************************************************************************************
# Code coverage config
#*********************************************************************************************************
LOCAL_USE_GCOV := no

include $(STATIC_LIBRARY_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************
