LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := 


LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include

LOCAL_MODULE:= opencv_easypr300

include $(BUILD_SHADED_LIBRARY)

