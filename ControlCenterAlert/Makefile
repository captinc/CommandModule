ARCHS = arm64 arm64e
TARGET = iphone:clang::11.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CommandModule
CommandModule_FILES = Tweak.xm
CommandModule_CFLAGS = -fobjc-arc
CommandModule_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
