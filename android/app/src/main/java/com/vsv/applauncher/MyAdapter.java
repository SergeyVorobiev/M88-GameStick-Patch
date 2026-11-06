package com.vsv.applauncher;

import static android.view.View.GONE;
import static android.view.View.VISIBLE;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class MyAdapter extends RecyclerView.Adapter<MyAdapter.ViewHolder> {

    private final ArrayList<ListItem> items;
    private final OnItemClickListener listener;

    public float textSize = 16;

    public interface OnItemClickListener {
        void onItemClick(int position, String name);
    }

    public MyAdapter(ArrayList<ListItem> items, OnItemClickListener listener) {
        this.items = items;
        this.listener = listener;
    }

    public void setItemName(String name, int index) {
        items.set(index, new ListItem(name));
        notifyDataSetChanged();
    }

    public void addItemName(String name) {
        items.add(new ListItem(name));
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.text, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        ListItem listItem = items.get(position);

        holder.textView.setText(listItem.displayName);
        holder.textView.setTextSize(textSize);
        if (listItem.drawable == null) {
            holder.imageView.setVisibility(GONE);
        } else {
            holder.imageView.setVisibility(VISIBLE);
            holder.imageView.setImageDrawable(listItem.drawable);
        }
        holder.textViewEnd.setText(listItem.textIcon);
        holder.itemView.setOnClickListener(v -> {
            if (listener != null) {
                listener.onItemClick(position, listItem.name);
            }
        });
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        TextView textView;
        ImageView imageView;

        TextView textViewEnd;
        ViewHolder(View itemView) {
            super(itemView);
            textView = itemView.findViewById(R.id.text2);
            imageView = itemView.findViewById(R.id.my_icon);
            textViewEnd = itemView.findViewById(R.id.text_end);
        }
    }
}