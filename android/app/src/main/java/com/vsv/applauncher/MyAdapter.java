package com.vsv.applauncher;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class MyAdapter extends RecyclerView.Adapter<MyAdapter.ViewHolder> {

    private final ArrayList<String> items;
    private final OnItemClickListener listener;

    public float textSize = 18;

    public interface OnItemClickListener {
        void onItemClick(int position, String name);
    }

    public MyAdapter(ArrayList<String> items, OnItemClickListener listener) {
        this.items = items;
        this.listener = listener;
    }

    public void setItemName(String name, int index) {
        items.set(index, name);
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(android.R.layout.simple_list_item_1, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        String name = items.get(position);
        holder.textView.setText(name);
        holder.textView.setTextSize(textSize);
        holder.itemView.setOnClickListener(v -> {
            if (listener != null) {
                listener.onItemClick(position, name);
            }
        });
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        TextView textView;

        ViewHolder(View itemView) {
            super(itemView);
            textView = itemView.findViewById(android.R.id.text1);
        }
    }
}