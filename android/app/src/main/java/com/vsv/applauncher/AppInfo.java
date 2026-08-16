package com.vsv.applauncher;

public class AppInfo {
    public String packageName;

    public String activityName;

    public String apkPath;

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
    }

    public boolean needCreateConfig() {
        return this.useConfigText && this.toDataPath != null && !this.toDataPath.isEmpty() && this.configText != null;
    }

    public boolean needCopyConfig() {
        if (this.useConfigText) {
            return false;
        }
        return !(this.fromDataPath == null || this.fromDataPath.isEmpty() || this.toDataPath == null || this.toDataPath.isEmpty());
    }
}
