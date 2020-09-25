ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)

PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/kowalski/config/permissions/org.kowalski.ota.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.kowalski.ota.xml

endif
