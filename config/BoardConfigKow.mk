include vendor/kowalski/config/BoardConfigKernel.mk

#ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
#include vendor/kowalski/config/BoardConfigQcom.mk
#endif

include vendor/kowalski/config/BoardConfigSoong.mk

#TOOLS_PATH_OVERRIDE := \
#    PATH=$(BUILD_TOP)/prebuilts/tools-bliss/$(HOST_OS)-x86/bin:$$PATH \
#    LD_LIBRARY_PATH=$(BUILD_TOP)/prebuilts/tools-bliss/$(HOST_OS)-x86/lib:$$LD_LIBRARY_PATH \
#    PERL5LIB=$(BUILD_TOP)/prebuilts/tools-bliss/common/perl-base

#PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE) | sed -e 's|$$|$$$$|g')

