LOCAL_PATH := $(realpath $(call my-dir))
OPENCV_ROOT_PATH := $(LOCAL_PATH)/../..


include $(CLEAR_VARS)
 
LOCAL_SRC_FILES := $(OPENCV_ROOT_PATH)/src/imgproc/src/featureselect.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/moments.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/accum.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/filter.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/morph.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/approx.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/phasecorr.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/blend.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/floodfill.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/canny.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/gabor.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/pyramids.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/clahe.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/rotcalipers.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/color.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/generalized_hough.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/samplers.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/colormap.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/geometry.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/segmentation.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/connectedcomponents.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/grabcut.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/shapedescr.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/contours.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/hershey_fonts.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/smooth.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/convhull.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/histogram.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/subdivision2d.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/corner.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/hough.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/sumpixels.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/cornersubpix.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/imgwarp.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/tables.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/demosaicing.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/intersection.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/templmatch.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/deriv.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/linefit.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/thresh.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/distransform.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/lsd.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/undistort.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/drawing.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/matchcontours.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/utils.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/emd.cpp \
                   $(OPENCV_ROOT_PATH)/src/imgproc/src/min_enclosing_triangle.cpp \


LOCAL_C_INCLUDES := $(OPENCV_ROOT_PATH)/include

LOCAL_CFLAGS += -D__OPENCV_BUILD \
                -D_ANDROID


LOCAL_MODULE:= opencv_imgproc300

include $(BUILD_STATIC_LIBRARY)

