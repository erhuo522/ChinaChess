package com.machfe.demo;

import java.io.File;

import com.machfe.easypr.EasyPRLib;

import android.app.Activity;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity {

   
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.activity_main);
		
		Button btnTest  = (Button) findViewById(R.id.btnTest);
		btnTest.setOnClickListener(new OnClickListener(){

			@Override
			public void onClick(View v) { 
				String strRoot = getRootPath();
				
				EasyPRLib.init(strRoot);
			}
			
		});
		
	}

	private String getRootPath() {

		String strStatus = Environment.getExternalStorageState();

		if (strStatus.equals(android.os.Environment.MEDIA_MOUNTED)) {
			File sdDir = Environment.getExternalStorageDirectory();
			return sdDir.toString();
		}else {
			File datFile = this.getExternalFilesDir(null);
			String strPath = datFile.getAbsolutePath();
			return strPath;
		}

	}
	 
}
