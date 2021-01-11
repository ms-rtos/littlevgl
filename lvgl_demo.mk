#*********************************************************************************************************
#
#                                    中国软件开源组织
#
#                                   嵌入式实时操作系统
#
#                                       MS-RTOS(TM)
#
#                               Copyright All Rights Reserved
#
#--------------文件信息--------------------------------------------------------------------------------
#
# 文   件   名: lvgl_demo.mk
#
# 创   建   人: IoT Studio
#
# 文件创建日期: 2019 年 12 月 14 日
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
LOCAL_TARGET_NAME := lvgl_demo

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/demo/lvgl_demo.c \
src/demo/lv_examples/src/assets/img_cogwheel_alpha16.c \
src/demo/lv_examples/src/assets/img_cogwheel_argb.c \
src/demo/lv_examples/src/assets/img_cogwheel_chroma_keyed.c \
src/demo/lv_examples/src/assets/img_cogwheel_indexed16.c \
src/demo/lv_examples/src/assets/img_cogwheel_rgb.c \
src/demo/lv_examples/src/assets/img_hand.c \
src/demo/lv_examples/src/assets/lv_font_montserrat_12_compr_az.c \
src/demo/lv_examples/src/assets/lv_font_montserrat_16_compr_az.c \
src/demo/lv_examples/src/assets/lv_font_montserrat_28_compr_az.c \
src/demo/lv_examples/src/lv_demo_benchmark/lv_demo_benchmark.c \
src/demo/lv_examples/src/lv_demo_keypad_encoder/lv_demo_keypad_encoder.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_list_pause.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_list_play.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_loop.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_next.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_pause.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_play.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_prev.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_btn_rnd.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_corner_left.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_corner_right.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_cover_1.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_cover_2.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_cover_3.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_icon_1.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_icon_2.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_icon_3.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_icon_4.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_list_border.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_logo.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_slider_knob.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_wave_bottom.c \
src/demo/lv_examples/src/lv_demo_music/assets/img_lv_demo_music_wave_top.c \
src/demo/lv_examples/src/lv_demo_music/assets/lv_demo_music_font_16_bold.c \
src/demo/lv_examples/src/lv_demo_music/lv_demo_music.c \
src/demo/lv_examples/src/lv_demo_music/lv_demo_music_list.c \
src/demo/lv_examples/src/lv_demo_music/lv_demo_music_main.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_icon_bright.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_icon_eco.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_icon_hue.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_icon_pc.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_icon_tel.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_icon_wifi.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_btn_bg_1.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_btn_bg_2.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_btn_bg_3.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_btn_bg_4.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_cloud.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_copy.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_internet.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_mobile.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_no_internet.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_phone.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_print.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_printer2.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_ready.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_scan.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_scan_example.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_setup.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_usb.c \
src/demo/lv_examples/src/lv_demo_printer/images/lv_demo_printer_img_wave.c \
src/demo/lv_examples/src/lv_demo_printer/lv_demo_printer.c \
src/demo/lv_examples/src/lv_demo_printer/lv_demo_printer_theme.c \
src/demo/lv_examples/src/lv_demo_stress/lv_demo_stress.c \
src/demo/lv_examples/src/lv_demo_widgets/lv_demo_widgets.c \
src/demo/lv_examples/src/lv_ex_get_started/lv_ex_get_started_1.c \
src/demo/lv_examples/src/lv_ex_get_started/lv_ex_get_started_2.c \
src/demo/lv_examples/src/lv_ex_get_started/lv_ex_get_started_3.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_1.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_10.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_11.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_2.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_3.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_4.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_5.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_6.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_7.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_8.c \
src/demo/lv_examples/src/lv_ex_style/lv_ex_style_9.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_arc/lv_ex_arc_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_arc/lv_ex_arc_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_bar/lv_ex_bar_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_btn/lv_ex_btn_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_btn/lv_ex_btn_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_btnmatrix/lv_ex_btnmatrix_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_calendar/lv_ex_calendar_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_canvas/lv_ex_canvas_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_canvas/lv_ex_canvas_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_chart/lv_ex_chart_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_chart/lv_ex_chart_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_checkbox/lv_ex_checkbox_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_cont/lv_ex_cont_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_cpicker/lv_ex_cpicker_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_cpicker/lv_ex_cpicker_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_dropdown/lv_ex_dropdown_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_dropdown/lv_ex_dropdown_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_gauge/lv_ex_gauge_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_gauge/lv_ex_gauge_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_img/lv_ex_img_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_img/lv_ex_img_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_img/lv_ex_img_3.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_imgbtn/imgbtn_blue.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_imgbtn/imgbtn_green.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_imgbtn/lv_ex_imgbtn_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_keyboard/lv_ex_keyboard_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_label/lv_ex_label_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_label/lv_ex_label_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_label/lv_ex_label_3.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_led/lv_ex_led_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_line/lv_ex_line_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_linemeter/lv_ex_linemeter_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_list/lv_ex_list_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_msgbox/lv_ex_msgbox_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_msgbox/lv_ex_msgbox_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_obj/lv_ex_obj_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_objmask/lv_ex_objmask_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_objmask/lv_ex_objmask_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_page/lv_ex_page_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_roller/lv_ex_roller_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_slider/lv_ex_slider_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_slider/lv_ex_slider_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_spinbox/lv_ex_spinbox_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_spinner/lv_ex_spinner_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_switch/lv_ex_switch_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_table/lv_ex_table_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_tabview/lv_ex_tabview_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_textarea/lv_ex_textarea_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_textarea/lv_ex_textarea_2.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_textarea/lv_ex_textarea_3.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_tileview/lv_ex_tileview_1.c \
src/demo/lv_examples/src/lv_ex_widgets/lv_ex_win/lv_ex_win_1.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"$(MSRTOS_BASE_PATH)/littlevgl/src/lvgl" \
-I"$(MSRTOS_BASE_PATH)/littlevgl/src" \
-I"./src/demo/lv_examples"

#*********************************************************************************************************
# Pre-defined macro (eg. -DYOUR_MARCO=1)
#*********************************************************************************************************
LOCAL_DSYMBOL :=  \
-DLV_CONF_INCLUDE_SIMPLE

#*********************************************************************************************************
# Depend library (eg. LOCAL_DEPEND_LIB := -la LOCAL_DEPEND_LIB_PATH := -L"Your library search path")
#*********************************************************************************************************
LOCAL_DEPEND_LIB      := -llittlevgl
LOCAL_DEPEND_LIB_PATH := -L"$(MSRTOS_BASE_PATH)/littlevgl/$(OUTDIR)"

#*********************************************************************************************************
# C++ config
#*********************************************************************************************************
LOCAL_USE_CXX        := no
LOCAL_USE_CXX_EXCEPT := no

#*********************************************************************************************************
# Code coverage config
#*********************************************************************************************************
LOCAL_USE_GCOV := no

#*********************************************************************************************************
# Stack check config
#*********************************************************************************************************
LOCAL_USE_STACK_CHECK := no

#*********************************************************************************************************
# User link command
#*********************************************************************************************************
LOCAL_PRE_LINK_CMD   := 
LOCAL_POST_LINK_CMD  := 
LOCAL_PRE_STRIP_CMD  := 
LOCAL_POST_STRIP_CMD := 

#*********************************************************************************************************
# Depend target
#*********************************************************************************************************
LOCAL_DEPEND_TARGET := $(OUTDIR)/liblittlevgl.a

include $(APPLICATION_MK)

#*********************************************************************************************************
# End
#*********************************************************************************************************
