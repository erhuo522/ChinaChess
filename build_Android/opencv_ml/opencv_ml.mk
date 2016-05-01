LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := $(OPENCV_ROOT_PATH)/src/ml/src/ann_mlp.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/inner_functions.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/lr.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/svm.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/boost.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/kdtree.cpp \
		   $(OPENCV_ROOT_PATH)/src/ml/src/nbayes.cpp \
		   $(OPENCV_ROOT_PATH)/src/ml/src/testset.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/data.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/tree.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/em.cpp \
                   $(OPENCV_ROOT_PATH)/src/ml/src/knearest.cpp \
	           $(OPENCV_ROOT_PATH)/src/ml/src/rtrees.cpp \



LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include

LOCAL_CFLAGS += -D__OPENCV_BUILD \
                -D_ANDROID

LOCAL_MODULE:= opencv_ml300


LOCAL_STATIC_LIBRARIES :=  opencv_core300 opencv_hal300

include $(BUILD_SHARED_LIBRARY)

