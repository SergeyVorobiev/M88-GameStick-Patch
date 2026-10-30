from tkinter import ttk
import tkinter as tk

from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.ClickableLink import ClickableLink
from src.db.UI.Strings import Strings


class MissedAppsPopup:
    def __init__(self, parent,
                 title=Strings.Current.DIALOG_ATTENTION,
                 missed_app = None,
                 width = 300,
                 height = 220,
                 after_destroy_callback=None):
        if after_destroy_callback is None:
            self.after_destroy = lambda : 0
        else:
            self.after_destroy = after_destroy_callback
        self.top = tk.Toplevel(parent)
        self.top.title(title)
        self.width = width
        self.height = height
        self.top.transient(parent)
        self.top.grab_set()
        self.top.resizable(False, False)
        self.top.attributes('-topmost', True)
        self.center_window(parent)
        self.top.iconbitmap(GlobalUI.icon)
        self.top.protocol("WM_DELETE_WINDOW", self.cancel)
        if missed_app is None:
            self.layout_1()
        else:
            self.layout_2(missed_app)
        self.top.bind("<Escape>", lambda e: self.cancel())

        self.top.focus_force()
        self.top.update_idletasks()

    def layout_2(self, message):
        msg_label = ttk.Label(self.top, text=message, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))

        msg_label = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT2, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))

        link = ClickableLink(self.top,
                             text=Strings.Current.APPS_LABEL,
                             url=GlobalUI.apps_url)
        link.pack(pady=(5, 10))

        msg_label2 = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_DETAILS_TEXT, font=("Consolas", 10),
                               wraplength=self.width - 20,
                               justify="center")
        msg_label2.pack(pady=(10, 5))

        link2 = ClickableLink(self.top,
                              text=Strings.Current.GITHUB_README,
                              url=GlobalUI.github_url)
        link2.pack(pady=(5, 5))

        btn_frame = ttk.Frame(self.top)
        btn_frame.pack(side="bottom", pady=15)
        cancel_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_CANCEL, command=self.cancel, width=12)
        cancel_btn.pack(padx=8)

    def layout_1(self):
        msg_label = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT, font=("Consolas", 10), wraplength=self.width - 20,
                                   justify="center")
        msg_label.pack(pady=(20, 5))

        link = ClickableLink(self.top,
                             text=Strings.Current.APPS_LABEL,
                             url=GlobalUI.apps_url)
        link.pack(pady=(5, 10))

        msg_label2 = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT5, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label2.pack(pady=(0, 5))

        msg_label2 = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_DETAILS_TEXT, font=("Consolas", 10), wraplength=self.width - 20,
                                   justify="center")
        msg_label2.pack(pady=(10, 5))

        link2 = ClickableLink(self.top,
                                  text=Strings.Current.GITHUB_README,
                                  url=GlobalUI.github_url)
        link2.pack(pady=(5, 5))


        btn_frame = ttk.Frame(self.top)
        btn_frame.pack(side="bottom", pady=15)
        cancel_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_CANCEL, command=self.cancel, width=12)
        cancel_btn.pack(padx=8)

    def center_window(self, parent):
        self.top.update_idletasks()
        x = parent.winfo_x() + (parent.winfo_width() // 2) - self.width // 2
        y = parent.winfo_y() + (parent.winfo_height() // 2) - self.height // 2
        self.top.geometry(f"{self.width}x{self.height}+{x}+{y}")

    def cancel(self):
        self.top.destroy()
        self.after_destroy()
