package com.vsv.applauncher;

import java.util.ArrayList;

public class DeviceInfo {

    ArrayList<String> outputLines;

    String name = "";

    String classes = "";

    String path = "";

    boolean enabled = false;

    String descriptor = "";

    String location = "";

    int controllerNumber = -1;

    String uniqueId = "";

    String indentifier = "";

    String keyLayoutFile = "";

    String keyCharacterMapFile = "";

    String configurationFile = "";

    public DeviceInfo(ArrayList<String> outputLines) {
        this.outputLines = new ArrayList<>();
        for (String line : outputLines) {
            this.outputLines.add(line.trim());
        }
        name = this.outputLines.get(0);
        configurationFile = getPartAfterKeyword("ConfigurationFile:");
        keyCharacterMapFile = getPartAfterKeyword("KeyCharacterMapFile:");
        keyLayoutFile = getPartAfterKeyword("KeyLayoutFile:");
        indentifier = getPartAfterKeyword("Identifier:");
        uniqueId = getPartAfterKeyword("UniqueId:");
        String cNum = getPartAfterKeyword("ControllerNumber:");
        try {
            controllerNumber = Integer.parseInt(cNum);
        } catch (Exception e) {
            controllerNumber = -1;
        }
        location = getPartAfterKeyword("Location:");
        descriptor = getPartAfterKeyword("Descriptor:");
        String strEnabled = getPartAfterKeyword("Enabled:");
        try {
            enabled = Boolean.parseBoolean(strEnabled);
        } catch (Exception e) {
            enabled = false;
        }
        path = getPartAfterKeyword("Path:");
        classes = getPartAfterKeyword("Classes:");
    }

    private String getPartAfterKeyword(String keyword) {
        if (keyword == null || keyword.isEmpty()) {
            return "";
        }
        for (String line : this.outputLines) {

            if (line == null || line.isEmpty()) {
                continue;
            }
            int index = line.indexOf(keyword);
            if (index < 0) {
                continue;
            }
            index += keyword.length();
            return line.substring(index).trim();
        }
        return "";
    }
}
