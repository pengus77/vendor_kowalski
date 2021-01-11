
# Add variables that we wish to make available to soong here.
ifneq (,$(wildcard $(OUT_DIR)/.path_interposer_origpath))
ORIG_PATH := $(shell cat $(OUT_DIR)/.path_interposer_origpath)
endif
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_CC \
    KERNEL_CLANG_TRIPLE \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_FLAGS \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE \
    MAKE_PREBUILT \
    ORIG_PATH

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += kowalskiVarsPlugin

SOONG_CONFIG_NAMESPACES += kowalskiQcomVars
SOONG_CONFIG_kowalskiQcomVars += \
    uses_pre_uplink_features_netmgrd \
    uses_qti_camera_device

SOONG_CONFIG_kowalskiQcomVars_uses_pre_uplink_features_netmgrd := $(TARGET_USES_PRE_UPLINK_FEATURES_NETMGRD)
SOONG_CONFIG_kowalskiQcomVars_uses_qti_camera_device := $(TARGET_USES_QTI_CAMERA_DEVICE)

SOONG_CONFIG_kowalskiVarsPlugin :=

define addVar
  SOONG_CONFIG_kowalskiVarsPlugin += $(1)
  SOONG_CONFIG_kowalskiVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

