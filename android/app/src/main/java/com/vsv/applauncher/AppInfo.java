package com.vsv.applauncher;

import android.content.Context;

import java.io.File;

public class AppInfo {

    public String packageName;

    public String activityName;

    public String apkPath;

    public boolean generic;

    public String fromDataPath;

    public String toDataPath;

    public String name;

    public String apkName;

    public boolean useConfigText;

    public String configText;

    public AppInfo() {
        this.packageName = "";
        this.activityName = "";
        this.apkPath = "";
        this.apkName = "";
        this.fromDataPath = "";
        this.toDataPath = "";
        this.name = "";
        this.configText = "";
        this.useConfigText = true;
        this.generic = false;
    }

    public AppInfo(String name, String packageName, String activityName, String apkPath, String apkName, String fromDataPath, String toDataPath, String configText) {
        this.packageName = packageName;
        this.activityName = activityName;
        this.apkPath = apkPath;
        this.fromDataPath = fromDataPath;
        this.toDataPath = toDataPath;
        this.name = name;
        this.apkName = apkName;
        this.configText = configText;
        this.generic = false;
    }

    public boolean needCreateConfig() {
        return this.useConfigText && this.toDataPath != null && !this.toDataPath.isEmpty() && this.configText != null;
    }

    public String getApkPath(Context context) {
        String path = MainActivity.getExternalSdCardPaths(context) + "/Apps/" + this.apkName;
        if (new File(path).exists()) {
            return path;
        }
        return getSystemPath();
    }

    public boolean needCopyConfig() {
        if (this.useConfigText) {
            return false;
        }
        return !(this.fromDataPath == null || this.fromDataPath.isEmpty() || this.toDataPath == null || this.toDataPath.isEmpty());
    }

    public String getSystemPath() {
        return this.apkPath;
    }
}
