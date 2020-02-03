ARCHS = arm64 arm64e
TARGET = iphone:clang::11.0
include $(THEOS)/makefiles/common.mk

TOOL_NAME = commandmoduled
commandmoduled_FILES = main.m
commandmoduled_CFLAGS = -fobjc-arc
commandmoduled_CODESIGN_FLAGS = -Sent.xml

include $(THEOS_MAKE_PATH)/tool.mk
