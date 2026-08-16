package com.vsv.applauncher.data;

import android.content.Context;
import android.util.Log;

import com.vsv.applauncher.AppInfo;

import com.vsv.applauncher.MainActivity;
import com.vsv.applauncher.XMLTool;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;


public class Yaba extends AppInfoGetter {

    private String gamePathLine;
    private String gamePath;

    public Yaba(Context context) {
        super(context);
        appInfo = new AppInfo();
        appInfo.name = "Yaba (Sega Saturn)";
        appInfo.packageName = "org.devmiyax.yabasanshioro2.pro";
        appInfo.apkPath = "/system/preinstall/Yaba.apk";
        appInfo.apkName = "Yaba.apk";
        appInfo.activityName = "org.devmiyax.yabasanshiro.StartupActivity";
        appInfo.fromDataPath = "";
        // appInfo.toDataPath = "/data/user/0/org.devmiyax.yabasanshioro2.pro/shared_prefs/org.devmiyax.yabasanshioro2.pro_preferences.xml";
        appInfo.toDataPath = "/data_mirror/data_ce/null/0/org.devmiyax.yabasanshioro2.pro/shared_prefs/org.devmiyax.yabasanshioro2.pro_preferences.xml";
        gamePath = ((MainActivity)context).getExternalSdCardPaths() + "/roms/ss";
        gamePathLine = "    <string name=\"pref_game_directory\">" + gamePath + "</string>\n" + "</map>";
    }

    @Override
    public void beforeRun() {
        Document document = XMLTool.readPreferencesAsDocument(appInfo.toDataPath);
        if (document == null) {
            enableTvModeAndGameFolderAndSave();
        } else {
            enableTvModeAndGameFolderAndSave(document);
        }
    }

    public int enableTvModeAndGameFolderAndSave(Document doc) {
        int exitCode = -1;
        try {
            NodeList booleanNodes = doc.getElementsByTagName("boolean");
            for (int i = 0; i < booleanNodes.getLength(); i++) {
                Element el = (Element) booleanNodes.item(i);
                if ("pref_force_androidtv_mode".equals(el.getAttribute("name"))) {
                    String value = el.getAttribute("value");
                    if ("true".equals(value)) {
                        return 0;
                    }
                    el.setAttribute("value", "true");
                    break;
                }
            }

            NodeList stringNodes = doc.getElementsByTagName("string");
            for (int i = 0; i < stringNodes.getLength(); i++) {
                Element el = (Element) stringNodes.item(i);
                if ("pref_game_directory".equals(el.getAttribute("name"))) {
                    el.setTextContent(gamePath);
                    break;
                }
            }

            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer transformer = tf.newTransformer();
            transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
            transformer.setOutputProperty(OutputKeys.METHOD, "xml");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

            java.io.StringWriter writer = new java.io.StringWriter();
            transformer.transform(new DOMSource(doc), new StreamResult(writer));
            String xmlString = writer.toString();

            File tempFile = new File(context.getCacheDir(), "yaba_temp_prefs.xml");
            try (FileOutputStream fos = new FileOutputStream(tempFile)) {
                fos.write(xmlString.getBytes(StandardCharsets.UTF_8));
            }

            String shellCommand = "cp " + tempFile.getAbsolutePath() + " " + appInfo.toDataPath + " && " +
                    "chmod 600 " + appInfo.toDataPath + " && " +
                    "rm " + tempFile.getAbsolutePath();

            Process process = Runtime.getRuntime().exec(new String[]{"su", "root", shellCommand});
            exitCode = process.waitFor();
            Thread.sleep(200);
            Log.e(MainActivity.INFO_TAG, "Yaba copy config: " + exitCode);
        } catch (Exception e) {
            Log.e(MainActivity.INFO_TAG, "Yaba copy config: " + e);
        }
        return exitCode;
    }

    public void enableTvModeAndGameFolderAndSave() {
        String xmlString = configContext + gamePathLine;
        File tempFile = new File(context.getCacheDir(), "yaba_temp_prefs.xml");
        try (FileOutputStream fos = new FileOutputStream(tempFile)) {
            fos.write(xmlString.getBytes(StandardCharsets.UTF_8));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        String shellCommand = "cp " + tempFile.getAbsolutePath() + " " + appInfo.toDataPath + " && " +
                "chmod 600 " + appInfo.toDataPath + " && " +
                "rm " + tempFile.getAbsolutePath();

        Process process;
        try {
            process = Runtime.getRuntime().exec(new String[]{"su", "root", shellCommand});
            int exitCode = process.waitFor();
            Log.e(MainActivity.INFO_TAG, "Yaba copy config: " + exitCode);
        } catch (IOException | InterruptedException e) {
            Log.e(MainActivity.INFO_TAG, "Yaba copy config: " + e);
        }
    }

    String configContext = "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>\n" +
            "<map>\n" +
            "    <boolean name=\"pref_landscape\" value=\"false\" />\n" +
            "    <string name=\"pref_install_location\">0</string>\n" +
            "    <string name=\"pref_frameLimit\">0</string>\n" +
            "    <string name=\"pref_player1_inputdevice\">65535</string>\n" +
            "    <boolean name=\"pref_use_compute_shader\" value=\"true\" />\n" +
            "    <string name=\"pref_scsp_sync_per_frame\">4</string>\n" +
            "    <string name=\"pref_player2_inputdevice\">65535</string>\n" +
            "    <string name=\"pref_sound_engine\">1</string>\n" +
            "    <string name=\"pref_game_download_directory\">0</string>\n" +
            "    <boolean name=\"pref_force_androidtv_mode\" value=\"true\" />\n" +
            "    <boolean name=\"pref_fps\" value=\"false\" />\n" +
            "    <string name=\"pref_cpu\">3</string>\n" +
            "    <boolean name=\"pref_auto_state_save\" value=\"false\" />\n" +
            "    <string name=\"pref_video\">4</string>\n" +
            "    <string name=\"pref_polygon_generation\">2</string>\n" +
            "    <string name=\"pref_rbg_resolution\">0</string>\n" +
            "    <string name=\"pref_filter\">0</string>\n" +
            "    <boolean name=\"pref_immersive_mode\" value=\"false\" />\n" +
            "    <boolean name=\"pref_audio\" value=\"true\" />\n" +
            "    <boolean name=\"pref_extend_internal_memory\" value=\"true\" />\n" +
            "    <boolean name=\"pref_frameskip\" value=\"true\" />\n" +
            "    <string name=\"pref_resolution\">0</string>\n" +
            "    <string name=\"pref_aspect_rate\">0</string>\n" +
            "    <string name=\"scsp_time_sync_mode\">0</string>\n" +
            "    <boolean name=\"pref_rotate_screen\" value=\"false\" />\n" +
            "    <boolean name=\"pref_use_sh2_cache\" value=\"true\" />\n" +
            "    <boolean name=\"pref_use_cpu_affinity\" value=\"false\" />\n" +
            "    <string name=\"pref_cart\">7</string>\n";
}
