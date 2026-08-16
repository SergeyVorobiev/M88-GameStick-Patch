package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class DraStic extends AppInfoGetter {
    public DraStic(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "DraStic (DS)";
        appInfo.packageName = "com.dsemu.drastic";
        appInfo.apkPath = "/system/app/nds.apk";
        appInfo.apkName = "nds.apk";
        appInfo.activityName = "com.dsemu.drastic.DraSticActivity";
    }
}
