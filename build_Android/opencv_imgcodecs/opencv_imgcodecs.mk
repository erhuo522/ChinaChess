LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


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
 

LOCAL_MODULE:= opencv_imgcodecs300

include $(BUILD_STATIC_LIBRARY)
