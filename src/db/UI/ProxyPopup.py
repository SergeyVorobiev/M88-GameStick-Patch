import tkinter as tk
from tkinter import ttk

from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.EntryHint import EntryHint
from src.db.UI.Strings import Strings


class ProxyPopup:

    def __init__(self, parent, width = 490, height = 120, after_destroy=None):

        self.top = tk.Toplevel(parent)
        self.top.title(Strings.Current.PROXY_TITLE)
        if after_destroy is None:
            self.after_destroy = lambda: 0
        else:
            self.after_destroy = after_destroy
        self.width = width
        self.height = height
        self.top.transient(parent)
        self.top.grab_set()
        self.top.resizable(False, False)
        self.top.attributes('-topmost', True)
        self.center_window(parent)
        self.top.iconbitmap(GlobalUI.icon)
        self.top.protocol("WM_DELETE_WINDOW", self.cancel)
        frame = ttk.Frame(self.top)
        frame.pack(expand=True)
        self.entry_path = EntryHint(frame, text=GlobalUI.proxy, hint_text=Strings.Current.PROXY_HINT_EX + GlobalUI.proxy_example, width=80, font=("Segoe UI", 10))
        self.entry_path.pack(anchor="center", padx=8, pady=5)
        self.entry_path.bind("<KeyRelease>", self.on_key_release)

        frame2 = ttk.Frame(self.top)
        self.text_label = tk.Text(frame2,
                                  font=("Consolas", 8),
                                  bg="#f0f0f0",
                                  relief="flat",
                                  )

        self.text_label.insert("1.0", GlobalUI.proxy_example)
        self.text_label.config(state="disabled")
        self.text_label.pack(padx=(6, 0), pady=(5, 0))
        frame2.pack()

        self.entry_name = EntryHint(frame, text=GlobalUI.proxy_name, hint_text=Strings.Current.NAME_HINT_TEXT, width=80, font=("Segoe UI", 10))
        self.entry_name.pack(anchor="center", padx=8, pady=5)
        self.entry_name.bind("<KeyRelease>", self.on_name_key_release)

        self.entry_password = EntryHint(frame, text=GlobalUI.proxy_password, hint_text=Strings.Current.PASSWORD_HINT_TEXT, width=80, font=("Segoe UI", 10))
        self.entry_password.pack(anchor="center", padx=8, pady=5)
        self.entry_password.bind("<KeyRelease>", self.on_password_key_release)

        self.top.bind("<Button-1>", self._close_on_outside_click)
        self.top.bind("<Button-3>", self._close_on_outside_click)

    def center_window(self, parent):
        self.top.update_idletasks()
        x = parent.winfo_x() + (parent.winfo_width() // 2) - self.width // 2
        y = parent.winfo_y() + (parent.winfo_height() // 2) - self.height // 2
        self.top.geometry(f"{self.width}x{self.height}+{x}+{y}")

    def cancel(self):
        self.top.destroy()
        self.after_destroy()

    def _close_on_outside_click(self, event):
        x = event.x
        y = event.y
        if x < 0 or y < 0 or x > self.top.winfo_width() or y > self.top.winfo_height():
            self.cancel()

    # noinspection PyUnusedLocal
    def on_key_release(self, event):
        GlobalUI.proxy = self.entry_path.get()

    # noinspection PyUnusedLocal
    def on_name_key_release(self, event):
        GlobalUI.proxy_name = self.entry_name.get()

    # noinspection PyUnusedLocal
    def on_password_key_release(self, event):
        GlobalUI.proxy_password = self.entry_password.get()



