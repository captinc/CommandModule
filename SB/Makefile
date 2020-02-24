ARCHS = arm64 arm64e
TARGET = iphone:clang::11.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CommandModuleSB
CommandModuleSB_FILES = Tweak.xm
CommandModuleSB_CFLAGS = -fobjc-arc
CommandModuleSB_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
