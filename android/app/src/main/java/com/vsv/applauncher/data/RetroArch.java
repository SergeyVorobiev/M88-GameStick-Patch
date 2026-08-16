package com.vsv.applauncher.data;

import android.content.Context;
import android.util.Log;

import com.vsv.applauncher.AppInfo;
import com.vsv.applauncher.MainActivity;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class RetroArch extends AppInfoGetter {

    private final String placeHolder = "externalSdCard";

    public RetroArch(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "RetroArch (x64)";
        appInfo.packageName = "com.retroarch.aarch64";
        appInfo.apkPath = "/system/preinstall/manual/retroarch64.apk";
        appInfo.apkName = "retroarch64.apk";
        appInfo.activityName = "com.retroarch.browser.mainmenu.MainMenuActivity";
        appInfo.fromDataPath = "/system/res/retroarch.cfg";
        appInfo.toDataPath = "/storage/emulated/0/Android/data/com.retroarch.aarch64/files/retroarch.cfg";
        appInfo.configText = "";
        appInfo.useConfigText = false;
    }

    private void saveViaRoot(String content) {
        try {
            File tempFile = new File(context.getCacheDir(), "retroarch.cfg");
            try (FileOutputStream fos = new FileOutputStream(tempFile)) {
                fos.write(content.getBytes(StandardCharsets.UTF_8));
            }

            String targetDir = new File(appInfo.toDataPath).getParent();
            MainActivity.execute_command_and_log(new String[]{
                    "su", "root", "mkdir", "-p", targetDir
            });

            int exitCode = MainActivity.execute_command_and_log(new String[]{
                    "su", "root", "cp", tempFile.getAbsolutePath(), appInfo.toDataPath
            });

            MainActivity.execute_command_and_log(new String[]{
                    "su", "root", "chmod", "644", appInfo.toDataPath
            });

            boolean result = tempFile.delete();
            Log.i(MainActivity.INFO_TAG, "Temp file deleted: " + result);
            Log.i(MainActivity.INFO_TAG, "RetroArch config is placed to: " + appInfo.toDataPath + "\nExit code: " + exitCode);
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "RetroArch config error: " + e);
        }
    }

    private static String readFileViaRoot(String path) {
        try {
            Process process = Runtime.getRuntime().exec(new String[]{
                    "su", "root", "cat", path
            });

            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8)
            );
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append("\n");
            }
            int exitCode = process.waitFor();
            reader.close();
            if (exitCode != 0) {
                Log.e(MainActivity.INFO_TAG, "su cat exit code: " + exitCode);
                return null;
            }
            return sb.toString();

        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "su cat error: ", e);
            return null;
        }
    }

    @Override
    public int beforeInstall() {
        String config = readFileViaRoot(appInfo.fromDataPath);
        if (config == null) {
            return 0;
        }
        String sdPath = ((MainActivity)context).getExternalSdCardPaths();
        String result = config.replace(placeHolder, sdPath);
        saveViaRoot(result);
        return 0;
    }
}
