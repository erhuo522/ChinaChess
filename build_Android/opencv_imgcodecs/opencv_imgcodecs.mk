LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..

#---------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE := libjpeg
LOCAL_SRC_FILES := $(LOCAL_PATH)/../jni/static_libs/liblibjpeg.a
include $(PREBUILT_STATIC_LIBRARY)

#---------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE := libpng
LOCAL_SRC_FILES :=  $(LOCAL_PATH)/../jni/static_libs/liblibpng.a
include $(PREBUILT_STATIC_LIBRARY)

#---------------------------------------------------------------------


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := $(OPENCV_ROOT_PATH)/src/imgcodecs/src/bitstrm.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgcodecs/src/loadsave.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgcodecs/src/grfmt_base.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgcodecs/src/utils.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgcodecs/src/rgbe.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgcodecs/src/grfmt_bmp.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgcodecs/src/grfmt_png.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgcodecs/src/grfmt_jpeg.cpp \



LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include \
                    $(OPENCV_ROOT_PATH)/3rdparty/libpng \
                     $(OPENCV_ROOT_PATH)/3rdparty/libjpeg 
 


LOCAL_CFLAGS += -D__OPENCV_BUILD \
                -D_ANDROID

LOCAL_LDLIBS += -lz -llog

LOCAL_STATIC_LIBRARIES :=  opencv_core300 opencv_hal300 libpng libjpeg

LOCAL_MODULE:= opencv_imgcodecs300

include $(BUILD_SHARED_LIBRARY)

