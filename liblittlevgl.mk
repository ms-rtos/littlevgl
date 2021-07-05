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
src/lvgl/src/lv_core/lv_group.c \
src/lvgl/src/lv_core/lv_indev.c \
src/lvgl/src/lv_core/lv_disp.c \
src/lvgl/src/lv_core/lv_obj.c \
src/lvgl/src/lv_core/lv_refr.c \
src/lvgl/src/lv_core/lv_style.c \
src/lvgl/src/lv_draw/lv_draw_mask.c \
src/lvgl/src/lv_draw/lv_draw_blend.c \
src/lvgl/src/lv_draw/lv_draw_rect.c \
src/lvgl/src/lv_draw/lv_draw_label.c \
src/lvgl/src/lv_draw/lv_draw_line.c \
src/lvgl/src/lv_draw/lv_draw_img.c \
src/lvgl/src/lv_draw/lv_draw_arc.c \
src/lvgl/src/lv_draw/lv_draw_triangle.c \
src/lvgl/src/lv_draw/lv_img_decoder.c \
src/lvgl/src/lv_draw/lv_img_cache.c \
src/lvgl/src/lv_draw/lv_img_buf.c \
src/lvgl/src/lv_font/lv_font.c \
src/lvgl/src/lv_font/lv_font_fmt_txt.c \
src/lvgl/src/lv_font/lv_font_loader.c \
src/lvgl/src/lv_font/lv_font_montserrat_8.c \
src/lvgl/src/lv_font/lv_font_montserrat_10.c \
src/lvgl/src/lv_font/lv_font_montserrat_12.c \
src/lvgl/src/lv_font/lv_font_montserrat_14.c \
src/lvgl/src/lv_font/lv_font_montserrat_16.c \
src/lvgl/src/lv_font/lv_font_montserrat_18.c \
src/lvgl/src/lv_font/lv_font_montserrat_20.c \
src/lvgl/src/lv_font/lv_font_montserrat_22.c \
src/lvgl/src/lv_font/lv_font_montserrat_24.c \
src/lvgl/src/lv_font/lv_font_montserrat_26.c \
src/lvgl/src/lv_font/lv_font_montserrat_28.c \
src/lvgl/src/lv_font/lv_font_montserrat_30.c \
src/lvgl/src/lv_font/lv_font_montserrat_32.c \
src/lvgl/src/lv_font/lv_font_montserrat_34.c \
src/lvgl/src/lv_font/lv_font_montserrat_36.c \
src/lvgl/src/lv_font/lv_font_montserrat_38.c \
src/lvgl/src/lv_font/lv_font_montserrat_40.c \
src/lvgl/src/lv_font/lv_font_montserrat_42.c \
src/lvgl/src/lv_font/lv_font_montserrat_44.c \
src/lvgl/src/lv_font/lv_font_montserrat_46.c \
src/lvgl/src/lv_font/lv_font_montserrat_48.c \
src/lvgl/src/lv_font/lv_font_montserrat_12_subpx.c \
src/lvgl/src/lv_font/lv_font_montserrat_28_compressed.c \
src/lvgl/src/lv_font/lv_font_unscii_8.c \
src/lvgl/src/lv_font/lv_font_dejavu_16_persian_hebrew.c \
src/lvgl/src/lv_misc/lv_area.c \
src/lvgl/src/lv_misc/lv_task.c \
src/lvgl/src/lv_misc/lv_fs.c \
src/lvgl/src/lv_misc/lv_anim.c \
src/lvgl/src/lv_misc/lv_mem.c \
src/lvgl/src/lv_misc/lv_ll.c \
src/lvgl/src/lv_misc/lv_color.c \
src/lvgl/src/lv_misc/lv_txt.c \
src/lvgl/src/lv_misc/lv_txt_ap.c \
src/lvgl/src/lv_misc/lv_math.c \
src/lvgl/src/lv_misc/lv_log.c \
src/lvgl/src/lv_misc/lv_gc.c \
src/lvgl/src/lv_misc/lv_utils.c \
src/lvgl/src/lv_misc/lv_async.c \
src/lvgl/src/lv_misc/lv_printf.c \
src/lvgl/src/lv_misc/lv_bidi.c \
src/lvgl/src/lv_misc/lv_debug.c \
src/lvgl/src/lv_hal/lv_hal_disp.c \
src/lvgl/src/lv_hal/lv_hal_indev.c \
src/lvgl/src/lv_hal/lv_hal_tick.c \
src/lvgl/src/lv_themes/lv_theme.c \
src/lvgl/src/lv_themes/lv_theme_material.c \
src/lvgl/src/lv_themes/lv_theme_mono.c \
src/lvgl/src/lv_themes/lv_theme_empty.c \
src/lvgl/src/lv_themes/lv_theme_template.c \
src/lvgl/src/lv_widgets/lv_arc.c \
src/lvgl/src/lv_widgets/lv_bar.c \
src/lvgl/src/lv_widgets/lv_checkbox.c \
src/lvgl/src/lv_widgets/lv_cpicker.c \
src/lvgl/src/lv_widgets/lv_dropdown.c \
src/lvgl/src/lv_widgets/lv_keyboard.c \
src/lvgl/src/lv_widgets/lv_line.c \
src/lvgl/src/lv_widgets/lv_msgbox.c \
src/lvgl/src/lv_widgets/lv_spinner.c \
src/lvgl/src/lv_widgets/lv_roller.c \
src/lvgl/src/lv_widgets/lv_table.c \
src/lvgl/src/lv_widgets/lv_tabview.c \
src/lvgl/src/lv_widgets/lv_tileview.c \
src/lvgl/src/lv_widgets/lv_btn.c \
src/lvgl/src/lv_widgets/lv_calendar.c \
src/lvgl/src/lv_widgets/lv_chart.c \
src/lvgl/src/lv_widgets/lv_canvas.c \
src/lvgl/src/lv_widgets/lv_gauge.c \
src/lvgl/src/lv_widgets/lv_label.c \
src/lvgl/src/lv_widgets/lv_list.c \
src/lvgl/src/lv_widgets/lv_slider.c \
src/lvgl/src/lv_widgets/lv_textarea.c \
src/lvgl/src/lv_widgets/lv_spinbox.c \
src/lvgl/src/lv_widgets/lv_btnmatrix.c \
src/lvgl/src/lv_widgets/lv_cont.c \
src/lvgl/src/lv_widgets/lv_img.c \
src/lvgl/src/lv_widgets/lv_imgbtn.c \
src/lvgl/src/lv_widgets/lv_led.c \
src/lvgl/src/lv_widgets/lv_linemeter.c \
src/lvgl/src/lv_widgets/lv_page.c \
src/lvgl/src/lv_widgets/lv_switch.c \
src/lvgl/src/lv_widgets/lv_win.c \
src/lvgl/src/lv_widgets/lv_objmask.c \
src/ms_lvgl_display.c \
src/ms_lvgl_indev.c \
src/ms_lvgl_fs.c \
src/ms_lvgl_async_event.c

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
