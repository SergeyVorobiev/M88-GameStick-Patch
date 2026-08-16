package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

public class DolphinTV extends AppInfoGetter {

    public DolphinTV(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.apkName = "dolphin.apk";
        appInfo.name = "Dolphin Tv (Wii / GameCube)";
        appInfo.packageName = "org.dolphinemu.dolphinemu";
        appInfo.apkPath = "/system/preinstall/manual/dolphin.apk";
        appInfo.activityName = "org.dolphinemu.dolphinemu.ui.main.TvMainActivity";
        appInfo.fromDataPath = "";
        appInfo.toDataPath = "/storage/emulated/0/Android/data/org.dolphinemu.dolphinemu/files/Config/Dolphin.ini";
        appInfo.configText = "[General]\n" +
                "ISOPath0 = content://com.android.externalstorage.documents/tree/primary%3APictures\n" +
                "ISOPaths = 2\n" +
                "ISOPath1 = content://com.android.externalstorage.documents/tree/primary%3AMisc\n";
    }
}
