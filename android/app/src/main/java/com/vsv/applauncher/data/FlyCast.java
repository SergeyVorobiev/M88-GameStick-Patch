package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class FlyCast extends AppInfoGetter {
    public FlyCast(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "Flycast (Dreamcast / Naomi)";
        appInfo.packageName = "com.flycast.emulator";
        appInfo.apkPath = "/system/app/flycast/flycast.apk";
        appInfo.apkName = "flycast.apk";
        appInfo.activityName = "com.reicast.emulator.MainActivity";
    }
}
