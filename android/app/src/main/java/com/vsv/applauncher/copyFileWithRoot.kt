package com.vsv.applauncher

import android.util.Log
import java.io.BufferedReader
import java.io.DataOutputStream
import java.io.InputStreamReader

fun writeStringToFileWithRoot(content: String, targetPath: String): Boolean {
    return try {
        val process = Runtime.getRuntime().exec("su")
        val os = DataOutputStream(process.outputStream)

        val command = """
            mkdir -p "$(dirname "$targetPath")" &&
            echo '$content' > "$targetPath" &&
            chmod 666 "$targetPath" &&
            echo "Write success"
        """.trimIndent()

        os.writeBytes(command + "\n")
        os.writeBytes("exit\n")
        os.flush()

        val exitCode = process.waitFor()
        val output = BufferedReader(InputStreamReader(process.inputStream)).readText()

        Log.d("RootWrite", "Exit: $exitCode | Output: $output")

        exitCode == 0 && output.contains("Write success")

    } catch (e: Exception) {
        Log.e("RootWrite",  e.toString())
        false
    }
}

fun copyFileWithRoot(source: String, target: String): Boolean {
    try {
        val process = Runtime.getRuntime().exec("su")
        val os = DataOutputStream(process.outputStream)

        os.writeBytes("cp -f \"$source\" \"$target\" && echo 'cp ok' || echo 'cp failed'\n")
        os.writeBytes("chmod 666 \"$target\" && echo 'chmod ok' || echo 'chmod failed'\n")
        os.writeBytes("echo 'done'\n")
        os.writeBytes("exit\n")
        os.flush()

        val exitCode = process.waitFor()

        val output = BufferedReader(InputStreamReader(process.inputStream)).readText()
        val error = BufferedReader(InputStreamReader(process.errorStream)).readText()

        Log.d("RootCopy", "Exit code: $exitCode")
        Log.d("RootCopy", "Output: $output")
        Log.d("RootCopy", "Error: $error")

        return exitCode == 0

    } catch (e: Exception) {
        Log.e("RootCopy", e.toString())
        return false
    }
}