package com.vsv.applauncher;

import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;



public class TestKeys {
    public interface InputListener {
        void line(String line);
    }
    private Process process;

    private Thread processThread;

    private BufferedReader reader;

    private InputListener inputListener;

    private String devInput = "";

    private boolean runTest = false;

    public void stopTest() {
        if (process != null) {
            process.destroyForcibly();
        }
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException e) {
                //
            }
        }
        if (processThread != null) {
            processThread.interrupt();
        }
        processThread = null;
        reader = null;
        process = null;
    }

    public boolean testRun() {
        return runTest;
    }

    public void setInputListener(InputListener inputListener) {
        this.inputListener = inputListener;
    }

    public void setDevInput(String devInput) {
        stopTest();
        this.devInput = devInput;
    }

    public void startTest() {
        stopTest();
        if (this.devInput == null || this.devInput.isEmpty()) {
            return;
        }
        Log.i(MainActivity.INFO_TAG, "Starting to intercept keys for " + this.devInput);
        processThread = new Thread(() -> {
            runTest = true;
            try {
                process = Runtime.getRuntime().exec(new String[]{
                        "su", "root", "getevent", devInput,
                });

                reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                while ((line = reader.readLine()) != null) {
                    if (inputListener != null) {
                        inputListener.line(line);
                    }
                }
            } catch (Exception e) {
                Log.e(MainActivity.INFO_TAG, "TestKeys process error: " + e);
            } finally {
                runTest = false;
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e) {
                        //
                    }
                }
                if (process != null) {
                    MainActivity.logErrorStream(process);
                    process.destroy();
                }
            }
            Log.i(MainActivity.INFO_TAG, "Intercepting keys for " + this.devInput + " finished");
        });
        processThread.setDaemon(true);
        processThread.start();
    }
}
