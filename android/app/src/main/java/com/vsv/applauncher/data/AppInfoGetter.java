package com.vsv.applauncher.data;

import android.content.Context;

import com.vsv.applauncher.AppInfo;

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
}
