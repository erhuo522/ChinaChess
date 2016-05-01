LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := $(OPENCV_ROOT_PATH)/src/hal/src/mathfuncs.cpp \
                   $(OPENCV_ROOT_PATH)/src/hal/src/matrix.cpp \
                   $(OPENCV_ROOT_PATH)/src/hal/src/stat.cpp \

LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include

LOCAL_MODULE:= opencv_hal300

include $(BUILD_STATIC_LIBRARY)

