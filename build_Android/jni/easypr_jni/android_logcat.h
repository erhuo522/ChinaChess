
#ifndef ANDROIDLOG_H_
#define ANDROIDLOG_H_

#define  LOG_TAG  “easypr”
#include <android/log.h>

#define  LOGI(LOG_TAG, ...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGE(LOG_TAG, ...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
#define  LOGD(LOG_TAG, ...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)

#endif /* ANDROIDLOG_H_ */
