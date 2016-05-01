LOCAL_PATH := $(call my-dir)
MY_BUILD_PATH  := $(LOCAL_PATH)

include $(MY_BUILD_PATH)/../opencv_hal/opencv_hal.mk
include $(MY_BUILD_PATH)/../opencv_core/opencv_core.mk
include $(MY_BUILD_PATH)/../opencv_ml/opencv_ml.mk
include $(MY_BUILD_PATH)/../opencv_imgproc/opencv_imgproc.mk
include $(MY_BUILD_PATH)/../opencv_objdetect/opencv_objdetect.mk
include $(MY_BUILD_PATH)/../opencv_imgcodecs/opencv_imgcodecs.mk
include $(MY_BUILD_PATH)/../opencv_easypr/opencv_easypr.mk


LOCAL_PATH = $(MY_BUILD_PATH)



#---------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE := libjpeg
LOCAL_SRC_FILES := static_libs/liblibjpeg.a
include $(PREBUILT_STATIC_LIBRARY)

#---------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE := libpng
LOCAL_SRC_FILES :=  static_libs/liblibpng.a
include $(PREBUILT_STATIC_LIBRARY)

#---------------------------------------------------------------------

 
include $(CLEAR_VARS)


LOCAL_SRC_FILES := easypr_jni/easypr_api_jni.cpp



LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include \
                    $(OPENCV_ROOT_PATH)/include/easypr \


LOCAL_STATIC_LIBRARIES := opencv_easypr300 opencv_objdetect300 opencv_ml300 opencv_imgproc300 opencv_imgcodecs300 opencv_core300 opencv_hal300 libjpeg libpng

LOCAL_LDLIBS :=  -L$(SYSROOT)/usr/lib -llog  -lz

LOCAL_MODULE    := jni_easypr

include $(BUILD_SHARED_LIBRARY)
