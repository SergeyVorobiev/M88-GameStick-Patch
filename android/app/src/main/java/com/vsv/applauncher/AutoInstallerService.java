package com.vsv.applauncher;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.graphics.Path;
import android.os.Build;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import java.util.List;

public class AutoInstallerService extends AccessibilityService {
    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
        String packageName = event.getPackageName().toString();


        Log.d("ACCESS", "Event: " + packageName);

        if (packageName.contains("packageinstaller") || 
            packageName.contains("installer")) {
            
            AccessibilityNodeInfo root = getRootInActiveWindow();
            if (root == null) return;

            List<AccessibilityNodeInfo> installButtons =
                root.findAccessibilityNodeInfosByText("Install");
            
            if (installButtons.isEmpty()) {
                installButtons = root.findAccessibilityNodeInfosByText("Установить");
            }
            
            if (installButtons.isEmpty()) {
                installButtons = root.findAccessibilityNodeInfosByText("OK");
            }
            

            if (!installButtons.isEmpty()) {
                clickByGesture(installButtons.get(0));
                //installButtons.get(0).performAction(
                //    AccessibilityNodeInfo.ACTION_CLICK
                //);
            }
        }
    }
    
    @Override
    public void onInterrupt() {}

    private void clickByGesture(AccessibilityNodeInfo button) {
        if (button == null) return;

        android.graphics.Rect rect = new android.graphics.Rect();
        button.getBoundsInScreen(rect);

        if (rect.isEmpty()) {
            Log.e("ACCESSIBILITY", "Button has no bounds!");
            return;
        }

        int x = rect.centerX();
        int y = rect.centerY();

        Log.d("ACCESSIBILITY", "Clicking at coordinates: " + x + ", " + y);

        Path clickPath = new Path();
        clickPath.moveTo(x, y);

        GestureDescription.StrokeDescription stroke =
                new GestureDescription.StrokeDescription(clickPath, 0, 1000);

        GestureDescription gesture = new GestureDescription.Builder()
                .addStroke(stroke)
                .build();

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            dispatchGesture(gesture, new GestureResultCallback() {
                @Override
                public void onCompleted(GestureDescription gestureDescription) {
                    Log.d("ACCESSIBILITY", "Gesture completed!");
                }

                @Override
                public void onCancelled(GestureDescription gestureDescription) {
                    Log.e("ACCESSIBILITY", "Gesture cancelled!");
                }
            }, null);
        }
    }
}