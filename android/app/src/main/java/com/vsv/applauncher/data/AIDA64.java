package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class AIDA64 extends AppInfoGetter {
    public AIDA64(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "AIDA64";
        appInfo.packageName = "com.finalwire.aida64";
        appInfo.apkPath = "/system/preinstall/manual/aida.apk";
        appInfo.apkName = "aida.apk";
        //appInfo.apkPath = "/acct/aida.apk";
        //appInfo.apkPath = "/storage/emulated/0/Pictures/aida.apk";
        //appInfo.apkPath = "/storage/A046-6AFE/Download/aida.apk";
        appInfo.activityName = "com.finalwire.aida64.HHMainActivity";
    }
}
