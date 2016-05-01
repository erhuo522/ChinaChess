#include "easypr_api_jni.h"
#include "android_logcat.h"

#include "easypr.h"

JNIEXPORT void JNICALL Java_com_machfe_easypr_EasyPRLib_init
(JNIEnv*  env, jobject  obj, jstring path)
{
    const char* szpath = env->GetStringUTFChars(path, 0);
    
    std::string strImage = std::string(szpath)+ "/easypr_data/resources/image/test.jpg";
    std::string strSVM = std::string(szpath)+ "/easypr_data/resources/model/svm.xml";
    std::string strANN = std::string(szpath)+ "/easypr_data/resources/model/ann.xml";
    std::string strChar = std::string(szpath)+ "/easypr_data/etc/province_mapping";

    env->ReleaseStringUTFChars(path,szpath);
    
    LOGE("EasyPRLib", "image = %s", strImage.c_str()); 
    LOGE("EasyPRLib", "svm = %s", strSVM.c_str()); 
    LOGE("EasyPRLib", "ann = %s", strANN.c_str()); 
    LOGE("EasyPRLib", "char = %s", strChar.c_str()); 
   
    if(easypr::api::init(strANN.c_str(), strChar.c_str()))
    {
	LOGE("EasyPRLib", " init return true");
    }

    std::vector<std::string> results;
    if(easypr::api::plate_recognize(results, strImage.c_str(), strSVM.c_str(), strANN.c_str()))
    {
       LOGE("EasyPRLib", " plate_recognize return true");
    }

    
	
}