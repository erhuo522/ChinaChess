LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := $(OPENCV_ROOT_PATH)/src/objdetect/src/cascadedetect_convert.cpp \
                   $(OPENCV_ROOT_PATH)/src/objdetect/src/cascadedetect.cpp \
                   $(OPENCV_ROOT_PATH)/src/objdetect/src/detection_based_tracker.cpp \
                   $(OPENCV_ROOT_PATH)/src/objdetect/src/haar.cpp\
                   $(OPENCV_ROOT_PATH)/src/objdetect/src/hog.cpp\
                 


LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include

LOCAL_CFLAGS += -D__OPENCV_BUILD \
                -D_ANDROID

LOCAL_MODULE:= opencv_objdetect300

include $(BUILD_STATIC_LIBRARY)

