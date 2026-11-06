package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;
import com.vsv.applauncher.InstallManager;
import com.vsv.applauncher.MainActivity;

import java.io.File;

public class AppInfoGetter {

    protected AppInfo appInfo;

    protected Context context;

    public AppInfoGetter(Context context) {
        this.context = context;
    }

    public AppInfo getAppInfo() {
        return appInfo;
    }

    public int beforeInstall() {
        return 0;
    }

    public void afterInstall() {

    }

    public void beforeRun() {

    }

    public boolean exists() {
        boolean installed = InstallManager.isAppInstalled(this.context, appInfo.packageName);
        return installed || new File(appInfo.getSystemPath()).exists() || onSdCard();
    }

    public boolean onSdCard() {
        if (appInfo.apkName == null || appInfo.apkName.isEmpty()) {
            return false;
        }
        return new File(MainActivity.getExternalSdCardPaths(context) + "/Apps/" + appInfo.apkName).exists();
    }
}
