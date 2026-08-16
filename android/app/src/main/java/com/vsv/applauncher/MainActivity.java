package com.vsv.applauncher;

import android.app.Activity;
import android.content.Intent;
import android.hardware.input.InputManager;
import android.hardware.usb.UsbDevice;
import android.hardware.usb.UsbManager;
import android.os.Bundle;
import android.os.storage.StorageManager;
import android.provider.Settings;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.widget.Switch;
import android.widget.TextView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.vsv.applauncher.data.AIDA64;
import com.vsv.applauncher.data.AppInfoGetter;
import com.vsv.applauncher.data.CPUZ;
import com.vsv.applauncher.data.Citra;
import com.vsv.applauncher.data.Dolphin;
import com.vsv.applauncher.data.DolphinTV;
import com.vsv.applauncher.data.DraStic;
import com.vsv.applauncher.data.FlyCast;
import com.vsv.applauncher.data.NetherSX2;
import com.vsv.applauncher.data.RetroArch;
import com.vsv.applauncher.data.TotalCommander;
import com.vsv.applauncher.data.Yaba;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;


public class MainActivity extends Activity {

    public static final String INFO_TAG = "Info";
    private LogAdapter logAdapter;

    private MyAdapter listAdapter;

    private TextView gamepadView1 = null;

    private TextView gamepadView2 = null;

    private TextView gamepadView3 = null;

    private boolean killSignal = false;

    private boolean useFirstKeyCodeTextView = true;

    private int lastKeycode = -1;

    private InstallManager installManager;

    RecyclerView logRecyclerView = null;

    private BufferedReader logReader = null;

    private Process logProcess = null;

    private boolean isDensityReset = false;

    private TestKeys testKeys = new TestKeys();

    @Override
    protected void onResume() {
        super.onResume();
        startLogcat();
        if (installManager != null) {
            Log.d(INFO_TAG, "Try to force stop: " + installManager.lastLaunchedPackage);
            installManager.forceStopLastApp();
        }
        Log.d(INFO_TAG, "onResume\n");
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Log.d(INFO_TAG, "onRestart\n");
    }

    @Override
    protected void onStart() {
        super.onStart();
        Log.d(INFO_TAG, "onStart\n");
        if (!isDensityReset) {
            execute_command_and_log(new String[]{"su", "root", "wm", "density", "reset"});
            isDensityReset = true;
        }
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.d(INFO_TAG, "onStop\n");
        if (killSignal) {
            killSignal = false;
            int pid = android.os.Process.myPid();
            android.os.Process.killProcess(pid);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d(INFO_TAG, "onPause\n");
        if (logProcess != null) {
            logProcess.destroyForcibly();
            logProcess = null;
        }
        if (logReader != null) {
            try {
                logReader.close();
            } catch (IOException e) {
                //
            }
            logReader = null;
        }
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode != lastKeycode) {
            lastKeycode = keyCode;
            useFirstKeyCodeTextView = !useFirstKeyCodeTextView;
        }
/*
        if (keyCode == KeyEvent.KEYCODE_BACK) {

            if (false) {
                this.finishAndRemoveTask();
                killSignal = true;
                return true;
            }
        }
*/
        String result = InputInfo.getKeyInfo(keyCode, event);
        if (useFirstKeyCodeTextView)
            gamepadView1.setText(result);
        else
            gamepadView2.setText(result);
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        return super.onKeyUp(keyCode, event);
    }

    @Override
    public boolean onGenericMotionEvent(MotionEvent event) {
        String result = InputInfo.getMotionEventInfo(event);
        gamepadView3.setText(result);
        return super.onGenericMotionEvent(event);
    }

    public static void logErrorStream(Process process) {
        try {
            BufferedReader reader2 = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            while (true) {
                String line = reader2.readLine();
                if (line == null) {
                    break;
                }
                Log.e(MainActivity.INFO_TAG, line);
            }
            reader2.close();
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "Process exception: " + e);
        }
        Log.e(INFO_TAG, "Process exit value: " + process.exitValue());
    }

    public static void logInputStream(Process process) {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            while (true) {
                String line = reader.readLine();
                if (line == null) {
                    break;
                }
                Log.i(MainActivity.INFO_TAG, line);
            }
            reader.close();
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "Process exception: " + e);
        }
    }

    public static void logProcessOutput(Process process) {
        logInputStream(process);
        logErrorStream(process);
    }

    public static int execute_command_and_log(String[] command) {
        try {
            String strCommand = Arrays.toString(Arrays.stream(command).toArray());
            Log.e(INFO_TAG, "Executing the command: " + strCommand);
            Process process = Runtime.getRuntime().exec(command);
            int result = process.waitFor();
            logProcessOutput(process);
            process.destroy();
            return result;
        } catch (Exception e) {
            Log.e(INFO_TAG, "Execution command exception: " + e);
        }
        return -1;
    }

    public String getExternalSdCardPaths() {
        StorageManager sm;
        sm = (StorageManager) this.getSystemService(STORAGE_SERVICE);
        if (sm == null) return "";

        List<android.os.storage.StorageVolume> volumes = sm.getStorageVolumes();
        for (android.os.storage.StorageVolume volume : volumes) {
            if (volume.isRemovable() && !volume.isEmulated()) {
                File file = volume.getDirectory();
                if (file != null) {
                    return file.getPath();
                }
            }
        }
        return "";
    }

    public static void log_prop(String prop) {
        execute_command_and_log(new String[]{"getprop", prop});
    }

    public void openAccessibilitySettings() {
        Intent intent = new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(intent);
    }

    public boolean getRAState() {
        String sdPath = getExternalSdCardPaths();
        sdPath += "/RetroArch/useRA64";
        return new File(sdPath).exists();
    }
    public void removeRAFile() {
        String sdPath = getExternalSdCardPaths();
        sdPath += "/RetroArch/useRA64";
        boolean result = new File(sdPath).delete();
        Log.e(MainActivity.INFO_TAG, "" + result);
        try {
            Thread.sleep(250);
        } catch (InterruptedException e) {
            //
        }
    }

    public void createRaFile() {
        String sdPath = getExternalSdCardPaths();
        sdPath += "/RetroArch/useRA64";
        try {
            new File(sdPath).createNewFile();
        } catch (IOException e) {
            Log.d(MainActivity.INFO_TAG, e.toString());
        }
        try {
            Thread.sleep(250);
        } catch (InterruptedException e) {
            //
        }
    }

    private void getUsbData() {
        UsbManager manager = (UsbManager) getSystemService(USB_SERVICE);
        HashMap<String, UsbDevice> deviceList = manager.getDeviceList();

        for (UsbDevice device : deviceList.values()) {
            System.out.println(device);
            // Both devices will match this filter
            //if (device.getVendorId() == YOUR_VENDOR_ID && device.getProductId() == YOUR_PRODUCT_ID) {
                // The tracking Key here is device.getDeviceName()
                // It returns distinct system strings like "/dev/bus/usb/001/002" vs "/dev/bus/usb/001/003"
            //    String uniquePhysicalPath = device.getDeviceName();

                // Request system permission to communicate with this specific physical port
             //   manager.requestPermission(device, mPermissionIntent);
            //}
        }

        InputManager inputManager = (InputManager) getSystemService(INPUT_SERVICE);

    }

    private void setControllerTestAdapter() {
        Switch raSwitch = findViewById(R.id.switch1);
        raSwitch.setVisibility(Switch.INVISIBLE);
        RecyclerView recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        DumpSysInput sysInput = new DumpSysInput(this);
        HashMap<String, DeviceInfo> map = sysInput.getDevicesInfo();
        ArrayList<String> items = new ArrayList<>();
        for (DeviceInfo device : map.values()) {
            items.add(device.name + "\n" + device.path);
        }
        items.add("Select a Device");
        items.add("Erase Logs");
        items.add("Print Input Info");
        items.add("Back");
        listAdapter = new MyAdapter(items, (position, name) -> {
            if (name.equals("Close Test")) {
                testKeys.stopTest();
                listAdapter.setItemName("Select a Device", listAdapter.getItemCount() - 4);
                return;
            }
            if (testKeys.testRun()) {
                return;
            }
            DeviceInfo dev = null;
            try {
                dev = map.get(name.split("\n")[1]);
            } catch (Throwable th) {
                //
            }

            if (dev != null) {
                for (String str : dev.outputLines) {
                    logAdapter.addLine(str);
                }
                logAdapter.addLine("\n");
                if (listAdapter != null) {
                    testKeys.setDevInput(dev.path);
                    listAdapter.setItemName("Test Keys for " + dev.path, listAdapter.getItemCount() - 4);
                }
                scrollLog();
                return;
            }
            if (name.contains("Test Keys for")) {
                testKeys.setInputListener(line -> {
                    runOnUiThread(() -> logAdapter.addLine(line));
                    scrollLog();
                });
                testKeys.startTest();
                listAdapter.setItemName("Close Test", listAdapter.getItemCount() - 4);
                return;
            }
            if (name.equals("Erase Logs")) {
                clearLogcat(true);
                return;
            }
            if (name.equals("Print Input Info")) {
                execute_command_and_log(new String[]{"su", "root", "dumpsys", "input"});
                return;
            }
            if (name.equals("Back")) {
                testKeys.stopTest();
                setMainAdapter();
            }
        });
        listAdapter.textSize = 12;
        recyclerView.setAdapter(listAdapter);
    }

    private void setMainAdapter() {
        Switch raSwitch = findViewById(R.id.switch1);
        raSwitch.setVisibility(Switch.VISIBLE);
        RecyclerView recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        AppInfoGetter[] appInfos = {
                new Yaba(this),
                new Dolphin(this),
                new DolphinTV(this),
                new CPUZ(this),
                new AIDA64(this),
                //new FlyCast(this),
                //new N64(this),
                new DraStic(this),
                new TotalCommander(this),
                new NetherSX2(this),
                new Citra(this),
                new RetroArch(this)
        };
        HashMap<String, AppInfoGetter> packages = new HashMap<>();
        for (var appInfo : appInfos) {
            packages.put(appInfo.getAppInfo().name, appInfo);
        }
        ArrayList<String> items = new ArrayList<>(packages.keySet());
        items.sort(String::compareTo);
        items.add("Reset RetroArch64 Config");
        items.add("Input Info");
        items.add("Erase Logcat");
        items.add("Exit");
        listAdapter = new MyAdapter(items, (position, name) -> {
            if (name.equals("Reset RetroArch64 Config")) {
                new RetroArch(this).beforeInstall();
                return;
            }
            if (name.equals("Input Info")) {
                //getUsbData();
                //scrollLog();
                setControllerTestAdapter();
                return;
            }
            if (name.equals("Erase Logcat")) {
                clearLogcat(false);
                return;
            }
            installManager = new InstallManager(this, packages);
            boolean result = installManager.startApp(name);

            if (result) {
                this.finishAndRemoveTask();
                killSignal = true;
            }
        });
        listAdapter.textSize = 18;
        recyclerView.setAdapter(listAdapter);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_layout);

        Switch raSwitch = findViewById(R.id.switch1);
        raSwitch.setOnClickListener((view)-> {
            Switch s = (Switch) view;
            if (!s.isChecked()) {
                removeRAFile();
            } else {
                createRaFile();
            }
            s.setChecked(getRAState());
        });
        raSwitch.setChecked(getRAState());
        setMainAdapter();
        gamepadView1 = findViewById(R.id.gamepadCodesView1);
        gamepadView2 = findViewById(R.id.gamepadCodesView2);
        gamepadView3 = findViewById(R.id.gamepadCodesView3);
        execute_command_and_log(new String[]{"sh", "-c", "su root id"});
        execute_command_and_log(new String[]{"su", "root", "wm", "density"});
        execute_command_and_log(new String[]{"su", "root", "wm", "size"});

        Log.i(INFO_TAG, "SD Card: " + getExternalSdCardPaths());
        Log.d(INFO_TAG, "OnCreate");
    }

    private void clearLogcat(boolean clearOnlyView) {
        logAdapter.clear();
        if (!clearOnlyView) {
            execute_command_and_log(new String[]{"su", "root", "logcat", "-c"});
        }

        /*
        try {
            execute_command_and_log(new String[]{"su", "root", "logcat", "-c"});
            //process = Runtime.getRuntime().exec(new String[]{
            //        "su", "root", "logcat", "-c"
            //});
            //process.waitFor();
        } catch (Exception e) {
            //
        } finally {
            if (process != null) {
                process.destroy();
            }
        }*/
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d(INFO_TAG, "OnDestroy");
        int pid = android.os.Process.myPid();
        android.os.Process.killProcess(pid);
    }

    @Override
    public void onBackPressed() {
        //super.onBackPressed();
    }

    private void scrollLog() {
        logRecyclerView.post(() -> logRecyclerView.scrollToPosition(logAdapter.getItemCount() - 1));
    }

    private void startLogcat() {
        logRecyclerView = findViewById(R.id.logRecyclerView);
        logAdapter = new LogAdapter();
        logRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        logRecyclerView.setAdapter(logAdapter);

        Thread thread = new Thread(() -> {
            try {
                logProcess = Runtime.getRuntime().exec(new String[]{
                        "logcat",
                        "-v", "time",
                        "com.vsv.applauncher:D",
                });
                if (logReader != null)
                    try {
                        logReader.close();
                    } catch (IOException e) {
                        //
                    }
                logReader = new BufferedReader(new InputStreamReader(logProcess.getInputStream()));
                String line;
                while ((line = logReader.readLine()) != null) {
                    String finalLine = line;
                    runOnUiThread(() -> logAdapter.addLog(finalLine));
                    scrollLog();
                }
            } catch (Exception e) {
                Log.e(INFO_TAG, "Logcat process error: " + e);
            } finally {
                if (logProcess != null) {
                    logProcess.destroy();
                }
                if (logReader != null) {
                    try {
                        logReader.close();
                    } catch (IOException e) {
                        //
                    }
                }
            }
        });
        thread.setDaemon(true);
        thread.start();
    }
}