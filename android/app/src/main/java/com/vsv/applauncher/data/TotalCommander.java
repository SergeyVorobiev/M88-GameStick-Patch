package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class TotalCommander extends AppInfoGetter {
    public TotalCommander(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "Total Commander";
        appInfo.packageName = "com.ghisler.android.TotalCommander";
        appInfo.apkPath = "/system/priv-app/totalcommander/totalcommander.apk";
        appInfo.activityName = "com.ghisler.android.TotalCommander.TotalCommander";
    }
}
