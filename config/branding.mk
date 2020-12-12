# Versioning System
KOWALSKI_VERSION ?= v1.0

ifneq ($(SIGNING_KEYS),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(SIGNING_KEYS)/releasekey
endif

# Set all versions
CUSTOM_BUILD_TYPE ?= UNOFFICIAL

CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)

CUSTOM_PLATFORM_VERSION := 11.0

TARGET_PRODUCT_SHORT := $(subst kowalski_,,$(CUSTOM_BUILD))

KOWALSKI_MOD_VERSION := KowalskiOS-$(KOWALSKI_VERSION)-$(CUSTOM_BUILD)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
CUSTOM_VERSION_PROP := 11

CUSTOM_PROPERTIES := \
    org.kowalski.version=$(CUSTOM_VERSION_PROP) \
    org.kowalski.build_date=$(CUSTOM_BUILD_DATE) \
    org.kowalski.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.kowalski.build_type=$(CUSTOM_BUILD_TYPE) \
    org.kowalski.build_version=$(KOWALSKI_VERSION)
