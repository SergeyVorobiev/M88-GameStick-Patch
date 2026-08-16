package com.vsv.applauncher;

import android.util.Pair;
import android.view.InputDevice;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;

import java.util.ArrayList;

public class InputInfo {

    public static String getMotionEventInfo(MotionEvent event) {
        StringBuilder builder = new StringBuilder("ME: ");
        int actionInt = event.getAction();
        ArrayList<Pair<String, String>> result = new ArrayList<>();
        for (int i = 0; i < 54; i++) {
            float value = event.getAxisValue(i);
            if (Math.abs(value) > 0.005) {
                // InputDevice.MotionRange range = event.getDevice().getMotionRange(i);
                String sValue = Float.toString(value);
                result.add(new Pair<>(MotionEvent.axisToString(i), sValue));
            }
        }
        String action = "Action: " + MotionEvent.actionToString(actionInt) + " (" + actionInt + ") ";
        builder.append(action);
        for (Pair<String, String> act : result) {
            String actString = act.first + ": " + act.second + " ";
            builder.append(actString);
        }
        builder.append(", ").append(getDeviceInfo(event));
        builder.append(", Source: 0x").append(Integer.toHexString(event.getSource())).append(" (").append(getInputDeviceType(event)).append(")");
        return builder.toString();
    }

    public static String getKeyInfo(int keyCode, KeyEvent event) {
        StringBuilder builder = new StringBuilder("KE: ");

        String key = "Key: " + KeyEvent.keyCodeToString(keyCode) + " (" + keyCode + ")";
        int actionInt = event.getAction();
        String action = "Action: " + MotionEvent.actionToString(actionInt) + " (" + actionInt + ")";
        String scanCode = "ScanCode: " + event.getScanCode() + " (0x" + Integer.toHexString(event.getScanCode()) + ")";
        builder.append(key).append(", ").append(action).append(", ").append(scanCode).append(", ");
        builder.append(getDeviceInfo(event));
        // getSources(builder, event);
        builder.append(", Source: 0x").append(Integer.toHexString(event.getSource())).append(" (").append(getInputDeviceType(event)).append(")");
        builder.append(", Repeat: ").append(event.getRepeatCount());
        return builder.toString();
    }
    public static String getDeviceInfo(InputEvent event) {
        InputDevice device = event.getDevice();
        String pid = "PID -";
        String vid = "VID -";
        int deviceId = event.getDeviceId();
        String deviceName = (device == null) ? "none" : device.getName();
        String num = "Num: " + ((device == null) ? "none" : device.getControllerNumber());
        String deviceIdString = "DeviceId: " + deviceId + " (" + deviceName + ")";
        String descriptor = "Desc: none";
        if (device != null) {
            pid = "PID 0x" + Integer.toHexString(device.getProductId()) + " (" + device.getProductId() + ")";
            vid = "VID 0x" + Integer.toHexString(device.getVendorId()) + " (" + device.getVendorId() + ")";
            deviceIdString = "DeviceId: " + deviceId + " (" + deviceName + ")";
            descriptor = "Desc: " + device.getDescriptor();
        }
        StringBuilder builder = new StringBuilder();
        builder.append(vid).append(", ").append(pid).append(", ").append(deviceIdString).append(", ").append(num).append(", ").append(descriptor);
        return builder.toString();
    }

    private static void appendSourceDescriptionIfApplicable(StringBuilder builder, int sources, int source,
                                                     String sourceName) {
        if ((sources & source) == source) {
            builder.append(sourceName);
            builder.append(", ");
        }
    }

    private static String getInputDeviceType(InputEvent event) {

        if (event.isFromSource(InputDevice.SOURCE_DPAD)) {
            return "DPAD";
        } else if (event.isFromSource(InputDevice.SOURCE_GAMEPAD)) {
            return "GAMEPAD";
        } else if (event.isFromSource(InputDevice.SOURCE_JOYSTICK)) {
            return "JOYSTICK";
        } else if (event.isFromSource(InputDevice.SOURCE_KEYBOARD)) {
            return "KEYBOARD";
        }
        return "UNKNOWN";
    }

    private static void getSources(StringBuilder builder, KeyEvent event) {
        int sources = event.getDevice().getSources();
        builder.append("Sources: 0x").append(sources).append(" (");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_KEYBOARD, "keyboard");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_DPAD, "dpad");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_TOUCHSCREEN, "touchscreen");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_MOUSE, "mouse");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_STYLUS, "stylus");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_TRACKBALL, "trackball");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_MOUSE_RELATIVE, "mouse_relative");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_TOUCHPAD, "touchpad");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_JOYSTICK, "joystick");
        appendSourceDescriptionIfApplicable(builder, sources, InputDevice.SOURCE_GAMEPAD, "gamepad");
        builder.setLength(builder.length() - 2);
        builder.append(")");
    }
}
