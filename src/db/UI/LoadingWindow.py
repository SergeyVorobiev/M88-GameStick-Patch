from tkinter import ttk
import tkinter as tk

from src.db.UI.GlobalUI import GlobalUI


class LoadingWindow:
    def __init__(self, root, title):
        self.top = tk.Toplevel(root, width=0)
        self.top.iconbitmap(GlobalUI.icon)
        self.top.attributes("-alpha", 0.0)
        #self.top.withdraw()
        self.top.title(title)
        self.top.transient(root)
        #self.top.overrideredirect(True)
        self.top.protocol("WM_DELETE_WINDOW", lambda: None)
        x = root.winfo_x() + (root.winfo_width() // 2) - 150
        y = root.winfo_y() + (root.winfo_height() // 2) - 75
        self.top.geometry(f"300x150+{x}+{y}")
        # self.top.attributes("-topmost", True)
        self.top.resizable(False, False)
        self.__label = ttk.Label(self.top, text="",font=("Consolas", 10))
        self.__label.pack(pady=20)
        self.progress = ttk.Progressbar(self.top, mode='indeterminate', length=250)
        self.progress.pack(pady=10)
        self.progress.start(10)
        self.top.grab_set()
        self.top.focus_force()
        self.top.attributes("-alpha", 1.0)
        #self.top.deiconify()
        self.top.update_idletasks()

    def set_text(self, text):
        self.__label.config(text=text)

    def destroy(self):
        self.progress.stop()
        self.top.destroy()