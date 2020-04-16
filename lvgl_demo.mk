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
src/demo/lv_examples/lv_apps/benchmark/benchmark.c \
src/demo/lv_examples/lv_apps/benchmark/benchmark_bg.c \
src/demo/lv_examples/lv_apps/demo/demo.c \
src/demo/lv_examples/lv_apps/demo/img_bubble_pattern.c \
src/demo/lv_examples/lv_apps/sysmon/sysmon.c \
src/demo/lv_examples/lv_apps/terminal/terminal.c \
src/demo/lv_examples/lv_apps/tpcal/tpcal.c \
src/demo/lv_examples/lv_tests/lv_test_group/lv_test_group.c \
src/demo/lv_examples/lv_tests/lv_test_misc/lv_test_task.c \
src/demo/lv_examples/lv_tests/lv_test_obj/lv_test_obj.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_arc/lv_test_arc.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_bar/lv_test_bar.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_btn/lv_test_btn.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_btnm/lv_test_btnm.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_canvas/lv_test_canvas.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_cb/lv_test_cb.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_chart/lv_test_chart.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_cont/lv_test_cont.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_cpicker/lv_test_cpicker.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_ddlist/lv_test_ddlist.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_gauge/lv_test_gauge.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_img/img_flower_icon.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_img/lv_test_img.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_imgbtn/imgbtn_img_1.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_imgbtn/imgbtn_img_2.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_imgbtn/imgbtn_img_3.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_imgbtn/imgbtn_img_4.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_imgbtn/lv_test_imgbtn.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_kb/lv_test_kb.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_label/lv_test_label.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_led/lv_test_led.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_line/lv_test_line.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_list/lv_test_list.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_lmeter/lv_test_lmeter.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_mbox/lv_test_mbox.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_page/lv_test_page.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_preload/lv_test_preload.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_roller/lv_test_roller.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_slider/lv_test_slider.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_sw/lv_test_sw.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_ta/lv_test_ta.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_table/lv_test_table.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_tabview/lv_test_tabview.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_tileview/lv_test_tileview.c \
src/demo/lv_examples/lv_tests/lv_test_objx/lv_test_win/lv_test_win.c \
src/demo/lv_examples/lv_tests/lv_test_stress/lv_test_stress.c \
src/demo/lv_examples/lv_tests/lv_test_theme/lv_test_theme_1.c \
src/demo/lv_examples/lv_tests/lv_test_theme/lv_test_theme_2.c \
src/demo/lv_examples/lv_tutorial/10_keyboard/lv_tutorial_keyboard.c \
src/demo/lv_examples/lv_tutorial/1_hello_world/lv_tutorial_hello_world.c \
src/demo/lv_examples/lv_tutorial/2_objects/lv_tutorial_objects.c \
src/demo/lv_examples/lv_tutorial/3_styles/lv_tutorial_styles.c \
src/demo/lv_examples/lv_tutorial/4_themes/lv_tutorial_themes.c \
src/demo/lv_examples/lv_tutorial/5_antialiasing/apple_icon_alpha.c \
src/demo/lv_examples/lv_tutorial/5_antialiasing/apple_icon_chroma.c \
src/demo/lv_examples/lv_tutorial/5_antialiasing/lv_tutorial_antialiasing.c \
src/demo/lv_examples/lv_tutorial/6_images/flower_icon_alpha.c \
src/demo/lv_examples/lv_tutorial/6_images/lv_tutorial_images.c \
src/demo/lv_examples/lv_tutorial/6_images/red_flower.c \
src/demo/lv_examples/lv_tutorial/6_images/red_rose_16.c \
src/demo/lv_examples/lv_tutorial/7_fonts/arial_20.c \
src/demo/lv_examples/lv_tutorial/7_fonts/lv_tutorial_fonts.c \
src/demo/lv_examples/lv_tutorial/8_animations/lv_tutorial_animations.c \
src/demo/lv_examples/lv_tutorial/9_responsive/lv_tutorial_responsive.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"./src/lvgl" \
-I"./src" \
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
LOCAL_DEPEND_LIB_PATH := -L"$(OUTDIR)"

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
