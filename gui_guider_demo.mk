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
# 文   件   名: gui_guider_demo.mk
#
# 创   建   人: IoT Studio
#
# 文件创建日期: 2021 年 01 月 30 日
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
LOCAL_TARGET_NAME := gui_guider_demo

#*********************************************************************************************************
# Source list
#*********************************************************************************************************
LOCAL_SRCS :=  \
src/gui-guider-demo/custom/custom.c \
src/gui-guider-demo/generated/events_init.c \
src/gui-guider-demo/generated/guider_fonts/lv_font_simsun_12.c \
src/gui-guider-demo/generated/guider_fonts/lv_font_simsun_14.c \
src/gui-guider-demo/generated/guider_fonts/lv_font_simsun_16.c \
src/gui-guider-demo/generated/guider_fonts/lv_font_simsun_18.c \
src/gui-guider-demo/generated/guider_fonts/lv_font_simsun_20.c \
src/gui-guider-demo/generated/guider_fonts/lv_font_simsun_22.c \
src/gui-guider-demo/generated/gui_guider.c \
src/gui-guider-demo/generated/images/_bright_alpha_24x24.c \
src/gui-guider-demo/generated/images/_btn2_alpha_115x140.c \
src/gui-guider-demo/generated/images/_btn2_alpha_85x100.c \
src/gui-guider-demo/generated/images/_btn3_alpha_115x140.c \
src/gui-guider-demo/generated/images/_btn3_alpha_85x100.c \
src/gui-guider-demo/generated/images/_btn4_alpha_115x140.c \
src/gui-guider-demo/generated/images/_btn4_alpha_85x100.c \
src/gui-guider-demo/generated/images/_btn_bg_1_alpha_85x100.c \
src/gui-guider-demo/generated/images/_cloud_alpha_55x40.c \
src/gui-guider-demo/generated/images/_copy_alpha_29x29.c \
src/gui-guider-demo/generated/images/_eco_alpha_21x21.c \
src/gui-guider-demo/generated/images/_example_alpha_250x150.c \
src/gui-guider-demo/generated/images/_example_alpha_300x172.c \
src/gui-guider-demo/generated/images/_hue_alpha_21x21.c \
src/gui-guider-demo/generated/images/_internet_alpha_30x30.c \
src/gui-guider-demo/generated/images/_mobile_alpha_30x30.c \
src/gui-guider-demo/generated/images/_no_internet_alpha_25x25.c \
src/gui-guider-demo/generated/images/_pc_alpha_21x21.c \
src/gui-guider-demo/generated/images/_phone_alpha_45x55.c \
src/gui-guider-demo/generated/images/_printer2_alpha_60x55.c \
src/gui-guider-demo/generated/images/_print_alpha_29x29.c \
src/gui-guider-demo/generated/images/_ready_alpha_100x100.c \
src/gui-guider-demo/generated/images/_scan_alpha_29x29.c \
src/gui-guider-demo/generated/images/_setup_alpha_29x29.c \
src/gui-guider-demo/generated/images/_tel_alpha_21x21.c \
src/gui-guider-demo/generated/images/_usb_alpha_30x30.c \
src/gui-guider-demo/generated/images/_wave_alpha_25x25.c \
src/gui-guider-demo/generated/images/_wifi_alpha_29x19.c \
src/gui-guider-demo/generated/setup_scr_copyhome.c \
src/gui-guider-demo/generated/setup_scr_copynext.c \
src/gui-guider-demo/generated/setup_scr_home.c \
src/gui-guider-demo/generated/setup_scr_loader.c \
src/gui-guider-demo/generated/setup_scr_printit.c \
src/gui-guider-demo/generated/setup_scr_prthome.c \
src/gui-guider-demo/generated/setup_scr_prtmb.c \
src/gui-guider-demo/generated/setup_scr_prtusb.c \
src/gui-guider-demo/generated/setup_scr_saved.c \
src/gui-guider-demo/generated/setup_scr_scanhome.c \
src/gui-guider-demo/generated/setup_scr_setup.c \
src/gui-guider-demo/lvgl_demo.c

#*********************************************************************************************************
# Header file search path (eg. LOCAL_INC_PATH := -I"Your header files search path")
#*********************************************************************************************************
LOCAL_INC_PATH := \
-I"$(MSRTOS_BASE_PATH)/littlevgl/src/lvgl" \
-I"$(MSRTOS_BASE_PATH)/littlevgl/src/lvgl/src/lv_font" \
-I"$(MSRTOS_BASE_PATH)/littlevgl/src" \
-I"$(MSRTOS_BASE_PATH)/littlevgl/src/porting" \
-I"./src/gui-guider-demo/generated/guider_fonts" \
-I"./src/gui-guider-demo/generated" \
-I"./src/gui-guider-demo/custom"

#*********************************************************************************************************
# Pre-defined macro (eg. -DYOUR_MARCO=1)
#*********************************************************************************************************
LOCAL_DSYMBOL :=  \
-DLV_CONF_INCLUDE_SIMPLE

#*********************************************************************************************************
# Compiler flags
#*********************************************************************************************************
LOCAL_CFLAGS   := 
LOCAL_CXXFLAGS := 
LOCAL_LINKFLAGS := 

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
# Use short command for link and ar
#*********************************************************************************************************
LOCAL_USE_SHORT_CMD := no

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
