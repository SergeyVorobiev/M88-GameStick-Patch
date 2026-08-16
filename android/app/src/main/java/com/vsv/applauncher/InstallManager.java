package com.vsv.applauncher;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import android.util.Log;

import androidx.core.content.FileProvider;

import com.vsv.applauncher.data.AppInfoGetter;

import java.io.DataOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class InstallManager {

    private final HashMap<String, AppInfoGetter> packages;

    public String lastLaunchedPackage = "";

    public interface InstallMethod {
        void install(final AppInfo appInfo);
    }

    private final Activity context;

    public InstallManager(Activity context, HashMap<String, AppInfoGetter> packages) {
        this.context = context;
        this.packages = packages;
    }

    public void installApk(AppInfoGetter appInfoGetter) {
        installApkRootPM(appInfoGetter, this::installAPK2);
    }

    public List<String> getVisibleInstalledApps(boolean log) {
        if (log)
            Log.d(MainActivity.INFO_TAG, "\n===================Packages===================");
        PackageManager pm = context.getPackageManager();

        Intent intent = new Intent(Intent.ACTION_MAIN);
        intent.addCategory(Intent.CATEGORY_LAUNCHER);
        ArrayList<String> result = new ArrayList<>();
        List<ResolveInfo> infos;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {

            infos = pm.queryIntentActivities(intent,
                    PackageManager.ResolveInfoFlags.of(PackageManager.MATCH_ALL));
        } else {
            infos = pm.queryIntentActivities(intent, PackageManager.MATCH_ALL);
        }
        for (ResolveInfo info : infos) {
            if (log)
                Log.d(MainActivity.INFO_TAG, info.activityInfo.packageName);
            result.add(info.activityInfo.packageName);
        }
        if (log)
            Log.d(MainActivity.INFO_TAG, "==============================================\n");
        return result;
    }

    public boolean isAppInstalled(String packageName) {
        List<String> apps = getVisibleInstalledApps(false);
        return apps.contains(packageName);
        /*
        PackageManager pm = this.getPackageManager();
        try {
            pm.getPackageInfo(packageName, 0);
            // Toast.makeText(this, "True", LENGTH_SHORT).show();
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
        */
    }

    private void installApkRootPM(final AppInfoGetter appInfoGetter, InstallMethod installMethod) {
        AppInfo appInfo = appInfoGetter.getAppInfo();
        final ProgressDialog dialog = new ProgressDialog(context);
        dialog.setMessage("Installing: " + appInfo.name);
        dialog.setCancelable(false);
        dialog.show();
        new Thread(() -> {
            String installPath = "/data/local/tmp/" + appInfo.apkName;
            int exitCode = MainActivity.execute_command_and_log(new String[]{"sh", "-c", "su root id"});
            if (exitCode == 0) {
                exitCode = appInfoGetter.beforeInstall();
            }
            if (exitCode == 0) {
                exitCode = MainActivity.execute_command_and_log(new String[]{"su", "root", "setenforce", "0"});
            }
            if (exitCode == 0) {
                exitCode = MainActivity.execute_command_and_log(new String[]{"su", "root", "cp", appInfo.apkPath, installPath});
            }
            if (exitCode == 0) {
                exitCode = MainActivity.execute_command_and_log(new String[]{"su", "root", "appops", "set", "com.vsv.applauncher", "REQUEST_INSTALL_PACKAGES", "allow"});
            }
            if (exitCode == 0) {
                exitCode = MainActivity.execute_command_and_log(new String[]{"su", "root", "chcon", "u:object_r:apk_data_file:s0", installPath});
            }
            if (exitCode == 0) {
                exitCode = MainActivity.execute_command_and_log(new String[]{"su", "root", "pm", "install", "-r", "-g", "-t", "--user", "0", installPath});
            }

            // Not expecting the result as the installation is already finished successfully
            MainActivity.execute_command_and_log(new String[]{"su", "root", "rm", installPath});
            if (exitCode != 0 && installMethod != null) {
                installMethod.install(appInfo);
            } else {
                if (appInfo.needCreateConfig()) {

                    //writeStringToFileWithRoot(appInfo.configText, appInfo.toDataPath);
                } else if (appInfo.needCopyConfig()) {
                    //MainActivity.execute_command_and_log(new String[]{"su", "root", "cp", appInfo.fromDataPath, appInfo.toDataPath});
                    //copyFileWithRoot(appInfo.fromDataPath, appInfo.toDataPath);
                }
            }
            Log.d(MainActivity.INFO_TAG, "Installation finished: " + exitCode);
            context.runOnUiThread(dialog::dismiss);
        }).start();
    }

    private void installAPK2(final AppInfo appInfo) {
        if (!Environment.isExternalStorageManager()) {
            //grantPermissionsViaRoot();
        }
        if (Environment.isExternalStorageManager()) {
            installPackage(appInfo.apkPath);
        } else {
            Log.d(MainActivity.INFO_TAG, "Install " + appInfo.name + ". Started the permission access procedure.");
            try {
                Intent intent = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
                intent.addCategory(Intent.CATEGORY_EMBED);
                intent.setData(Uri.parse("package:" + context.getPackageName()));
                context.startActivity(intent);
            } catch (Exception e) {
                Intent intent = new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION);
                context.startActivity(intent);
            }
        }
    }

    private void installPackage(String apkPath) {
        File apkFile = new File(apkPath);
        Log.d(MainActivity.INFO_TAG, "Installing the package: " + apkPath);

        //if (!apkFile.exists()) {
        //    Log.d(MainActivity.INFO_TAG, "APK file is not found: " + apkPath);
        //    return;
        //}
        String packageName = context.getApplicationContext().getPackageName();
        Uri apkUri = FileProvider.getUriForFile(
                context,
                packageName + ".provider",
                apkFile
        );

        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setDataAndType(apkUri, "application/vnd.android.package-archive");
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        intent.putExtra(Intent.EXTRA_NOT_UNKNOWN_SOURCE, true);
        try {
            context.startActivity(intent);
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "Install package error: " + e);
        }
    }

    public void grantPermissionsViaRoot() {
        try {
            String[] cmds = {
                    "appops set com.vsv.applauncher REQUEST_INSTALL_PACKAGES allow",
                    "appops set com.vsv.applauncher MANAGE_EXTERNAL_STORAGE allow"
            };
            for (String cmd : cmds) {
                int exitCode = Runtime.getRuntime().exec(new String[]{"su", "root", cmd}).waitFor();
                Log.d(MainActivity.INFO_TAG, "Command: " + cmd + " exitCode: " + exitCode);
            }
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "Root grant failed", e);
        }
    }

    private boolean needFinishingActivity(String name) {
        return name.equals("Total Commander") && new File(((MainActivity)context).getExternalSdCardPaths() + "/finishOnTC").exists();
    }

    public void forceStopLastApp() {
        if (!this.lastLaunchedPackage.isEmpty()) {
            forceStopPackage(this.lastLaunchedPackage);
            this.lastLaunchedPackage = "";
        }
    }

    public void forceStopPackage(String packageName) {
        try {
            Log.e(MainActivity.INFO_TAG, "Trying to stop app: " + packageName);
            Process suProcess = Runtime.getRuntime().exec(new String[]{"su", "root"});
            DataOutputStream os = new DataOutputStream(suProcess.getOutputStream());

            os.writeBytes("am force-stop " + packageName + "\n");
            os.writeBytes("exit\n");
            os.flush();

            suProcess.waitFor();
            int exitCode = suProcess.exitValue();

            if (exitCode != 0) {
                Log.e(MainActivity.INFO_TAG, "ForceStop: " + exitCode);
            }
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "ForceStop: " + e);
        }
    }

    public boolean startApp(String name) {
        AppInfoGetter infoGetter = packages.get(name);
        if (infoGetter == null) return true;
        AppInfo info = infoGetter.getAppInfo();

        if (this.isAppInstalled(info.packageName)) {
            infoGetter.beforeRun();
            Log.d(MainActivity.INFO_TAG, "Run: " + info.packageName);
            lastLaunchedPackage = info.packageName;
            Intent intent = new Intent();
            intent.setClassName(info.packageName, info.activityName);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return needFinishingActivity(name);
        } else {
            Log.d(MainActivity.INFO_TAG, "Install: " + info.packageName);
            this.installApk(infoGetter);
            return false;
        }
    }
}
