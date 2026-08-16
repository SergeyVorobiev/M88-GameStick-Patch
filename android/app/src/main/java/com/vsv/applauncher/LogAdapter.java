package com.vsv.applauncher;

import android.graphics.Typeface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LogAdapter extends RecyclerView.Adapter<LogAdapter.LogViewHolder> {

    private final List<String> logs = new ArrayList<>();
    private static final int MAX_LINES = 1000;

    public void addLog(String log) {
        String level = extractLogLevel(log);
        if (level.equals("V")) {
            return;
        }
        logs.add(log);
        if (logs.size() > MAX_LINES) {
            logs.remove(0);
        }
        notifyDataSetChanged();
    }

    public void addLine(String line) {
        logs.add(line);
        notifyDataSetChanged();
    }

    public void clear() {
        logs.clear();
        notifyDataSetChanged();
    }


    @Override
    public LogViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.text, parent, false);
        return new LogViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull LogViewHolder holder, int position) {
        String text = logs.get(position);
        String level = extractLogLevel(text);
        int color = getColorByLogLevel(level);
        holder.textView.setTextColor(color);
        holder.textView.setText(text);
    }

    private String extractLogLevel(String logLine) {
        if (logLine == null || logLine.isEmpty()) {
            return "?";
        }
        Pattern pattern = Pattern.compile("^\\d{2}-\\d{2}\\s+\\d{2}:\\d{2}:\\d{2}\\.\\d+\\s+([VDIWEFA])/");
        Matcher matcher = pattern.matcher(logLine);

        if (matcher.find()) {
            return matcher.group(1);
        }

        return "?";
    }

    private int getColorByLogLevel(String level) {
        switch (level) {
            case "D":
                return 0xff0064fa;
            case "I":
                return 0xff00ff00;
            case "E":
                return 0xfffa0000;
            case "W":
                return 0xffffd900;
            case "F":
                return 0xffc107fa;
        }
        return 0xffffffff; // (V)
    }

    @Override
    public int getItemCount() {
        return logs.size();
    }

    static class LogViewHolder extends RecyclerView.ViewHolder {
        TextView textView;
        public LogViewHolder(@NonNull View itemView) {
            super(itemView);
            textView = itemView.findViewById(android.R.id.text1);
            textView.setTextColor(0xFF00FF00);
            textView.setTypeface(Typeface.MONOSPACE);
            textView.setTextSize(8);
        }
    }
}