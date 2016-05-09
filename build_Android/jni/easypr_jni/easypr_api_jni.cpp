#include "easypr_api_jni.h"
#include "android_logcat.h"

#include "easypr.h"

JNIEXPORT void JNICALL Java_com_machfe_easypr_EasyPRLib_init
(JNIEnv*  env, jobject  obj, jstring path)
{

    const char* szpath = env->GetStringUTFChars(path, 0);

    std::string strSVM = std::string(szpath)+ "/easypr_data/resources/model/svm.xml";
    std::string strANN = std::string(szpath)+ "/easypr_data/resources/model/ann.xml";
    std::string strChar = std::string(szpath)+ "/easypr_data/etc/province_mapping";
    
    env->ReleaseStringUTFChars(path,szpath);

    
    if(easypr::api::init(strSVM.c_str(), strANN.c_str(), strChar.c_str()))
    {
        LOGE("EasyPRLib", " init return true");
    }else{
	LOGE("EasyPRLib", " init return false");
    }
    
}

    
JNIEXPORT jobjectArray JNICALL Java_com_machfe_easypr_EasyPRLib_Recognize
(JNIEnv*  env, jobject  obj, jstring path)
{
    
    const char* szpath = env->GetStringUTFChars(path, 0);
     
    std::vector<std::string> results;
    if(easypr::api::plate_recognize(results, szpath))
    {
        jclass cls = env->FindClass("com/machfe/easypr/LicenseNumber");
        jmethodID methodId = env->GetMethodID(cls, "<init>", "()V");
        jfieldID  numId = env->GetFieldID(cls, "strLicNum", "Ljava/lang/String;");
        
        jint  nResNum = results.size();
        jobjectArray reslutObjs = env->NewObjectArray(nResNum, cls, NULL);
        
        for(int i = 0; i < nResNum; i++)
        {
            jstring str = env->NewStringUTF(results[i].c_str());
            
            jobject  obj = env->NewObject(cls, methodId);
            env->SetObjectField(obj, numId, str);
            env->SetObjectArrayElement(reslutObjs, i, obj);
        }

        env->ReleaseStringUTFChars(path,szpath);    
        return  reslutObjs;
    }

    env->ReleaseStringUTFChars(path,szpath);
    return NULL;
}














