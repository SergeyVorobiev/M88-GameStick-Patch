package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class Citra extends AppInfoGetter {

    public Citra(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "Citra (3DS)";
        appInfo.packageName = "org.azahar_emu.azahar";
        appInfo.apkPath = "/system/preinstall/manual/citra.apk";
        appInfo.apkName = "citra.apk";
        appInfo.activityName = "org.citra.citra_emu.ui.main.MainActivity";
        appInfo.fromDataPath = "";
        appInfo.toDataPath = "";
    }
}
