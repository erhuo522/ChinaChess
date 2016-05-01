LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := $(OPENCV_ROOT_PATH)/src/core/src/algorithm.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/alloc.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/arithm.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/datastructs.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/matmul.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/stat.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/downhill_simplex.cpp \
	           $(OPENCV_ROOT_PATH)/src/core/src/matop.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/stl.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/dxt.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/matrix.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/system.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/array.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/glob.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/out.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/tables.cpp \
	           $(OPENCV_ROOT_PATH)/src/core/src/kmeans.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/parallel.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/types.cpp \
	           $(OPENCV_ROOT_PATH)/src/core/src/lapack.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/pca.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/umatrix.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/conjugate_gradient.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/lda.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/persistence.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/convert.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/lpsolver.cpp \
                   $(OPENCV_ROOT_PATH)/src/core/src/copy.cpp \
	   	   $(OPENCV_ROOT_PATH)/src/core/src/mathfuncs.cpp \
		   $(OPENCV_ROOT_PATH)/src/core/src/rand.cpp \

LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include

LOCAL_CFLAGS += -D__OPENCV_BUILD \
                -D_ANDROID

LOCAL_MODULE:= opencv_core300


include $(BUILD_STATIC_LIBRARY)

