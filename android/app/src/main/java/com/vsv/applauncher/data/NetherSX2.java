package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class NetherSX2 extends AppInfoGetter {

    public NetherSX2(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "NetherSX2 (PS2)";
        appInfo.apkName = "AetherSX2.apk";
        appInfo.packageName = "xyz.aethersx2.android";
        appInfo.apkPath = "/system/app/AetherSX2/AetherSX2.apk";
        appInfo.activityName = "xyz.aethersx2.android.MainActivity";
    }
}
