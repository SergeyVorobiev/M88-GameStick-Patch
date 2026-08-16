package com.vsv.applauncher;

import android.content.Context;
import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;


public class DumpSysInput {

    private Context context;

    public DumpSysInput(Context context) {
        this.context = context;
    }

    private ArrayList<String> getResult() {
        Process process = null;
        BufferedReader reader = null;
        ArrayList<String> result = new ArrayList<>();
        try {
            process = Runtime.getRuntime().exec(new String[]{"su", "root", "dumpsys", "input"});
            process.waitFor();
            reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                result.add(line);
            }
            MainActivity.logErrorStream(process);
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "Can't execute dumpsys input: " + e);
        } finally {
            if (process != null) {
                process.destroy();
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    //
                }
            }
        }
        return result;
    }

    public ArrayList<String> getResult2() {
        ArrayList<String> result = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(context.getAssets().open("test.txt")))) {
            String line;
            while ((line = reader.readLine()) != null) {
                result.add(line);
            }
        } catch (IOException e) {
            //
        }
        return result;
    }

    public HashMap<String, DeviceInfo> getDevicesInfo() {
        HashMap<String, DeviceInfo> devices = new HashMap<>();
        try {
            ArrayList<String> lines = getResult();
            for (int i = 0; i < lines.size(); i++) {
                String line = lines.get(i);

                // Found a branch
                if (line.contains("Classes:")) {
                    ArrayList<String> current = new ArrayList<>();
                    i = i - 1;
                    for (int j = 0; j < 12; j++) {
                        current.add(lines.get(i));
                        i += 1;
                    }
                    DeviceInfo info = new DeviceInfo(current);
                    devices.put(info.path, info);
                }
            }
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "Dumpsys parse error: " + e);
        }
        return devices;
    }
}
