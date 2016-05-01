LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := $(OPENCV_ROOT_PATH)/src/easypr/core/chars_identify.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/chars_recognise.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/chars_segment.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/core_func.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/feature.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/plate_detect.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/plate_judge.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/plate_locate.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/plate_recognize.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/core/plate.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/preprocess/deface.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/preprocess/gdts.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/preprocess/mc_data.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/train/train.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/train/ann_train.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/train/svm_train.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/util/kv.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/util/util.cpp \
                   $(OPENCV_ROOT_PATH)/src/easypr/util/program_options.cpp \

LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include \
                    $(OPENCV_ROOT_PATH)/include/easypr \


LOCAL_MODULE:= opencv_easypr300

include $(BUILD_SHARED_LIBRARY)

