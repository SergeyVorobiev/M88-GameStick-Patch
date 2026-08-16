package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class CPUZ extends AppInfoGetter {

    public CPUZ(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "CPU-Z";
        appInfo.apkName = "cpuz.apk";
        appInfo.packageName = "com.cpuid.cpu_z";
        appInfo.apkPath = "/system/preinstall/manual/cpuz.apk";
        appInfo.activityName = "com.cpuid.cpu_z.MainActivity";
    }
}
