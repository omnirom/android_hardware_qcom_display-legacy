#Common headers
common_includes := hardware/qcom/display-legacy/libgralloc
common_includes += hardware/qcom/display-legacy/libgenlock
common_includes += hardware/qcom/display-legacy/liboverlay
common_includes += hardware/qcom/display-legacy/libcopybit
common_includes += hardware/qcom/display-legacy/libqdutils
common_includes += hardware/qcom/display-legacy/libhwcomposer
common_includes += hardware/qcom/display-legacy/libexternal
common_includes += hardware/qcom/display-legacy/libqservice

common_header_export_path := qcom/display

#Common libraries external to display-caf HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers
#common_flags += -Werror

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

ifeq ($(TARGET_BOARD_PLATFORM), msm8974)
    common_flags += -DVENUS_COLOR_FORMAT
    common_flags += -DMDSS_TARGET
endif

common_deps  :=
kernel_includes :=

# Executed only on QCOM BSPs
ifeq ($(TARGET_USES_QCOM_BSP),true)
    common_flags += -DQCOM_BSP
endif
ifeq ($(call is-vendor-board-platform,QCOM),true)
    common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
    kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
endif
