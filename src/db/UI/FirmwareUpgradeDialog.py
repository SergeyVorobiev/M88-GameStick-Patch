import os.path
import threading
import time
import tkinter as tk
from pathlib import Path
from tkinter import ttk, scrolledtext

from src.MT6768.UIPipeline import UIPipeline
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.ClickableLink import ClickableLink
from src.db.UI.Strings import Strings


class FirmwareUpgradeDialog:
    def __init__(self, parent,
                 title=Strings.Current.DIALOG_ATTENTION,
                 width = 900,
                 height = 500):
        self.parent = parent
        self.top = tk.Toplevel(parent)
        self.top.title(title)
        self.width = width
        self.height = height
        self.top.transient(parent)
        self.top.grab_set()
        self.db_name = GlobalUI.new_db_name
        self.top.resizable(False, False)
        self.center_window(parent)
        self.top.iconbitmap(GlobalUI.icon)
        self.audio_fix = True
        self.remove_temps = True
        self.run = False
        self.msg_label = None
        self.proceed_btn =None
        self.cancel_btn = None
        self.console = None
        self.time_label = None
        self.del_var = tk.Variable(value=1)
        self.audio_fix_var = tk.Variable(value=1)
        state = self.check_state()
        if state == 0:
            self.layout_0()
        elif state == 1:
            self.layout_1()
        else:
            self.layout_2()

       # self.check_var = tk.Variable()
       # chk = ttk.Checkbutton(self.top, text=Strings.Current.SAVE_DB_CHECK_BOX_TITLE, variable=self.check_var, command=self.on_check_box_click)
       # chk.pack(pady=(8, 0))



        #proceed_btn = ttk.Button(btn_frame, text=proceed_text, command=self.proceed, width=12)
       # proceed_btn.pack(side="left", padx=8)


        self.top.focus_force()
        self.top.update_idletasks()

    def layout_0(self):
        self.width = 300
        self.height = 200
        self.center_window(self.parent)

        msg_label = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT, font=("Consolas", 10), wraplength=self.width - 20,
                                   justify="center")
        msg_label.pack(pady=(20, 5))

        link = ClickableLink(self.top,
                             text=Strings.Current.M88FW_LABEL,
                             url=GlobalUI.m88fw_url)
        link.pack(pady=(5, 10))

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

    def layout_1(self):
        self.width = 300
        self.height = 120
        self.center_window(self.parent)

        msg_label = ttk.Label(self.top, text=Strings.Current.USER_NOT_EXIST_MESSAGE, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))

        btn_frame = ttk.Frame(self.top)
        btn_frame.pack(side="bottom", pady=15)
        cancel_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_CANCEL, command=self.cancel, width=12)
        cancel_btn.pack(padx=8)

    def layout_2(self):
        btn_frame = ttk.Frame(self.top)
        btn_frame.pack(side="bottom", pady=15)
        self.proceed_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_START, command=self.proceed, width=12)
        self.proceed_btn.pack(side="left", padx=8)
        self.cancel_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_CANCEL, command=self.cancel, width=12)
        self.cancel_btn.pack(side="right", padx=8)
        lab_frame = ttk.Frame(self.top)
        lab_frame.pack(side="bottom", pady=0)
        self.time_label = ttk.Label(lab_frame, text="00:00", font=("Consolas", 10), wraplength=self.width - 20,
                                  justify="center")
        self.time_label.pack(side="right", pady=(0, 0))

        chk_delete_temp = ttk.Checkbutton(self.top, text=Strings.Current.REMOVE_TEMP_CHECK_BOX_TITLE,
                                          variable=self.del_var,
                                          command=self.on_check_del)
        chk_delete_temp.pack(pady=(20, 0), padx=20, anchor="w")
        chk_audio = ttk.Checkbutton(self.top, text=Strings.Current.FIX_AUDIO_CHECK_BOX_TITLE,
                                          variable=self.audio_fix_var,
                                          command=self.on_check_audio)
        chk_audio.pack(pady=(8, 0), padx=20, anchor="w")

        self.console = scrolledtext.ScrolledText(
            self.top,
            wrap=tk.WORD,
            font=("Consolas", 10),
            insertbackground="white",
            state='disabled'
        )
        self.console.pack(fill="both", padx=(20, 20), pady=(10,10), expand=True)

    def on_check_del(self):
        if str(self.del_var.get()) == '1':
            self.remove_temps = True
        else:
            self.remove_temps = False

    def on_check_audio(self):
        if str(self.audio_fix_var.get()) == '1':
            self.audio_fix = True
        else:
            self.audio_fix = False

    @staticmethod
    def get_time(start_time):
        end_time = time.perf_counter()
        elapsed = end_time - start_time
        minutes = int(elapsed // 60)
        seconds = int(elapsed % 60)
        return f"{minutes:02d}:{seconds:02d}"

    @staticmethod
    def check_state():
        Path(GlobalUI.firmware_folder)
        if not os.path.exists(GlobalUI.firmware_folder):
            return 0
        if not os.path.exists(GlobalUI.user_file):
            return 1
        return 2

    def center_window(self, parent):
        self.top.update_idletasks()
        x = parent.winfo_x() + (parent.winfo_width() // 2) - self.width // 2
        y = parent.winfo_y() + (parent.winfo_height() // 2) - self.height // 2
        self.top.geometry(f"{self.width}x{self.height}+{x}+{y}")

    def proceed(self):
        self.run = True
        def run_fix():
            try:
                self.cancel_btn['state'] = 'disabled'
                self.proceed_btn['state'] = 'disabled'
                self.top.protocol("WM_DELETE_WINDOW", lambda: None)
                pipe = UIPipeline(self.audio_fix, self.remove_temps, self.write)
                pipe.start()
            finally:
                self.run = False
                self.cancel_btn['state'] = 'normal'
                self.top.protocol("WM_DELETE_WINDOW", self.cancel)

        def run_time():
            start_time = time.perf_counter()
            while self.run:
                time.sleep(1)
                self.time_label.config(text=self.get_time(start_time))

        threading.Thread(target=run_fix, daemon=True).start()
        threading.Thread(target=run_time, daemon=True).start()

    def cancel(self):
        self.top.destroy()

    def write(self, *messages):
        text = ""
        for msg in messages:
            text += str(msg)
            text += " "
        self.console.configure(state='normal')
        self.console.insert(tk.END, text + "\n")
        self.console.see(tk.END)
        self.console.configure(state='disabled')