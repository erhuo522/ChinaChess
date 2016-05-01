package com.machfe.easypr;

public class EasyPRLib {
	
	public static native void init(String strPath);
	

	

    static 
	{
        System.loadLibrary("jni_easypr");
    }
}
