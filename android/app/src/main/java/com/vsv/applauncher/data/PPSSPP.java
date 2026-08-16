package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class PPSSPP extends AppInfoGetter {
    public PPSSPP(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "PPSSPP (PSP)";
        appInfo.packageName = "";
        appInfo.apkPath = "";
        appInfo.apkName = "";
        appInfo.activityName = "";
    }
}
