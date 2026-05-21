import tkinter as tk
from tkinter import ttk

from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Strings import Strings


class Popup:
    def __init__(self, parent, message,
                 title=Strings.Current.DIALOG_ATTENTION,
                 cancel_text=Strings.Current.DIALOG_CANCEL,
                 width = 400,
                 height = 200,
                 top_pad_y=40):
        self.top = tk.Toplevel(parent)
        self.top.title(title)
        self.width = width
        self.height = height
        self.top.transient(parent)
        self.top.grab_set()
        self.top.resizable(False, False)
        self.center_window(parent)
        self.top.iconbitmap(GlobalUI.icon)
        msg_label = ttk.Label(self.top, text=message, font=("Consolas", 10), wraplength=width-20, justify="center")
        msg_label.pack(pady=(top_pad_y, 10))

        btn_frame = ttk.Frame(self.top)
        btn_frame.pack(side="bottom", pady=15)

        cancel_btn = ttk.Button(btn_frame, text=cancel_text, command=self.cancel, width=12)
        cancel_btn.pack(side="left", padx=8)

        self.top.bind("<Escape>", lambda e: self.cancel())

        self.top.focus_force()
        self.top.update_idletasks()

    def center_window(self, parent):
        self.top.update_idletasks()
        x = parent.winfo_x() + (parent.winfo_width() // 2) - self.width // 2
        y = parent.winfo_y() + (parent.winfo_height() // 2) - self.height // 2
        self.top.geometry(f"{self.width}x{self.height}+{x}+{y}")

    def cancel(self):
        self.top.destroy()