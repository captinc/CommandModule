ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.0
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CommandModule
CommandModule_FILES = CommandModule.m
CommandModule_INSTALL_PATH = /Library/ControlCenter/Bundles
CommandModule_CFLAGS = -fobjc-arc
CommandModule_FRAMEWORKS = UIKit
CommandModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit

include $(THEOS_MAKE_PATH)/bundle.mk
