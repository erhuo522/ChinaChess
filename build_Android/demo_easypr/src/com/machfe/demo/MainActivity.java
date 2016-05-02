package com.machfe.demo;

import java.io.File;

import com.machfe.easypr.EasyPRLib;
import com.machfe.easypr.LicenseNumber;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {

	private String mStrRoot = null; 
	
	private TextView txtLicNum  =  null;
	private Button btnTest  = null;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.activity_main);
		
		txtLicNum = (TextView) findViewById(R.id.txtLicNum);
		btnTest = (Button) findViewById(R.id.btnTest);
		
		
		btnTest.setOnClickListener(new OnClickListener(){

			@Override
			public void onClick(View v) { 
				RecognizeAsyncTask task = new RecognizeAsyncTask(v.getContext());
				task.execute(mStrRoot);
			}
			
		});
		
		mStrRoot = getSdcardPath();
		EasyPRLib.init(mStrRoot);
		
	}
	
	private void  showLiceseNumber(LicenseNumber[] licNum){
		for(int i=0; i<licNum.length; i++){
			txtLicNum.setText(licNum[i].getNumber());
		}
	}

	private String getSdcardPath() {

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

	class RecognizeAsyncTask extends AsyncTask<String, Integer, LicenseNumber[]> {

 		private  ProgressDialog mDialog = null;

		public RecognizeAsyncTask(Context context){
			mDialog = new ProgressDialog(context);
			mDialog.setMessage(context.getString(R.string.wait_recognize));			
		}
		
		@Override
		protected void onPreExecute() {
			mDialog.show();			
		}

		@Override
		protected LicenseNumber[] doInBackground(String... params) {

			LicenseNumber[] licNum = EasyPRLib.Recognize(params[0]);
			return licNum;
		}

		protected void onPostExecute(LicenseNumber[] result) {

			mDialog.dismiss(); 
			
			if(result != null){
				showLiceseNumber(result);
			}
		}

	}
	 
}
