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

include $(CLEAR_VARS)

####JNI#################################################
AMAP_JNI_PATH = $(MY_BUILD_PATH)/../../../GDAmapAdapter/ANDROID/jni

LOCAL_C_INCLUDES += $(AMAP_JNI_PATH)  \

amap_jni_cpp = $(wildcard $(AMAP_JNI_PATH)/*.cpp)
AMAP_JNI_SRC =$(amap_jni_cpp:$(LOCAL_PATH)/%=%)

$(shell echo $(AMAP_JNI_SRC)>$(LOCAL_PATH)/echo_file)

######################################################

LOCAL_C_INCLUDES += \
    $(GD_AMAP_BASE_INCLUDE) \
    $(GD_AMAP_GRAPHIC_INCLUDE) \
    $(GD_AMAP_TOOLS_INCLUDE) \
    $(GD_AMAP_DATAMGR_INCLUDE) \
    $(GD_AMAP_MAP_MGR_INCLUDE) \

LOCAL_SRC_FILES := $(AMAP_JNI_SRC) \

LOCAL_MODULE    := gdinamapv4112

LOCAL_STATIC_LIBRARIES := \
gdamapbase  \
gdamapgraphic  \
gdamaptools  \
gdamapdatamgr  \
gdamapmapmgr  \

LOCAL_LDLIBS :=  -L$(SYSROOT)/usr/lib -llog -lGLESv1_CM -lz -ljnigraphics

include $(BUILD_SHARED_LIBRARY)
