#include "easypr_api_jni.h"
#include "android_logcat.h"



JNIEXPORT void JNICALL Java_com_machfe_easypr_EasyPRLib_init
(JNIEnv*  env, jobject  obj, jstring path)
{

    const char* szpath = env->GetStringUTFChars(path, 0);
    LOGE("EasyPRLib", " path = %s", szpath); 
    env->ReleaseStringUTFChars(path,szpath);
}