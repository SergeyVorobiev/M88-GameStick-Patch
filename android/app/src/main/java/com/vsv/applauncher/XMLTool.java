package com.vsv.applauncher;

import android.util.Log;

import org.w3c.dom.Document;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

public class XMLTool {

    public static Document readPreferencesAsDocument(String path) {
        try {
            Process process = Runtime.getRuntime().exec(new String[]{
                    "su", "root", "cat " + path});
            Log.e(MainActivity.INFO_TAG, "Executing the command: su root cat " + path);
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream())
            );
            StringBuilder xmlContent = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                xmlContent.append(line).append("\n");
            }
            int exitCode = process.waitFor();
            MainActivity.logProcessOutput(process);
            reader.close();

            if (exitCode != 0 || xmlContent.length() == 0) {
                Log.e(MainActivity.INFO_TAG, "" + exitCode);
                return null;
            }

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            return builder.parse(new ByteArrayInputStream(xmlContent.toString().getBytes()));

        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, e.toString());
            return null;
        }
    }
}
