package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class N64 extends AppInfoGetter {
    public N64(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "Mupen (N64)";
        appInfo.packageName = "org.mupen64plusae.v3.alpha";
        appInfo.apkPath = "/system/app/n64/n64.apk";
        appInfo.apkName = "n64.apk";
        appInfo.activityName = "paulscode.android.mupen64plusae.SplashActivity";
    }
}
