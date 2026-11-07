import os
import threading
import time
from pathlib import Path
from tkinter import ttk, scrolledtext
import tkinter as tk
from src.MT6768.UIPipeline import UIPipeline
from src.MainSystemTool import MainSystemTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.MissedAppsPopup import MissedAppsPopup
from src.db.UI.Strings import Strings


class MainTab:

    def __init__(self, parent, tab, tab_num):
        self.parent = parent
        self.tab = tab
        self.tab_num = tab_num

        self.proceed_btn = None
        self.cancel_btn = None
        self.time_label = None
        self.status_label = None
        self.chk_delete_temp = None
        self.chk_audio = None
        self.chk_replace = None
        self.chk_full = None
        self.chk_partial = None
        self.chk_minimal = None
        self.console = None
        self.chk_format_userdata = None
        self.chk_extend = None

        self.audio_fix_var = tk.Variable(value=1)
        self.replace_apks_var = tk.Variable(value=0)
        self.full_var = tk.Variable(value=0)
        self.partial_var = tk.Variable(value=1)
        self.minimal_var = tk.Variable(value=0)
        self.del_var = tk.Variable(value=1)
        self.format_userdata_var = tk.Variable(value=0)
        self.extend_user_data_var = tk.Variable(value=0)

        self.run = False
        self.full = False
        self.partial = True
        self.minimal = False
        self.audio_fix = True
        self.format_userdata = False
        self.extend_userdata = False
        self.remove_temps = True
        self.replace_apks = False
        self.init_main_tab(tab)

    def init_main_tab(self, tab):
        user_size = os.path.getsize(GlobalUI.user_file)
        btn_frame = ttk.Frame(tab)

        btn_frame.pack(side="bottom", pady=(10, 15))
        self.proceed_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_START, command=self.proceed, width=12)
        self.proceed_btn.pack(side="left", padx=8)
        self.cancel_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_CANCEL, command=self.cancel, width=12)
        self.cancel_btn.pack(side="right", padx=8)
        lab_frame = ttk.Frame(tab)
        lab_frame.pack(side="bottom", pady=0)
        lab_frame.grid_rowconfigure(0, pad=0)
        lab_frame.grid_rowconfigure(1, pad=0)

        control_frame = ttk.Frame(tab)
        control_frame.pack(side="top", pady=(10, 0), padx=(20, 0), anchor="w")
        control_frame.grid_rowconfigure(0, pad=0)
        control_frame.grid_rowconfigure(1, pad=0)
        self.time_label = ttk.Label(lab_frame, text="00:00", font=("Consolas", 10), wraplength=self.parent.width - 20,
                                    justify="center")
        self.time_label.grid(row=0, column=0, pady=(0, 0))

        self.status_label = ttk.Label(lab_frame, text=Strings.Current.UPGRADE_STATUS_LABEL_START, font=("Consolas", 10),
                                      wraplength=self.parent.width - 20,
                                      justify="center")
        self.status_label.grid(row=1, column=0, pady=(5, 0))

        user_label = ttk.Label(control_frame, text=Strings.Current.IMAGE_PATH_TITLE + str(Path(GlobalUI.user_file).absolute()), font=("Consolas", 10), wraplength=self.parent.width - 20, justify="left")
        user_label.grid(row=0, column=0, pady=(5, 0))
        size_label = ttk.Label(control_frame,
                               text=Strings.Current.IMAGE_SIZE_TITLE + GlobalUI.format_size(user_size, "MB"),
                               font=("Consolas", 10), wraplength=self.parent.width - 20,
                               justify="left")
        size_label.grid(row=1, column=0, pady=(10, 5), sticky="w")

        self.chk_delete_temp = ttk.Checkbutton(tab, text=Strings.Current.REMOVE_TEMP_CHECK_BOX_TITLE,
                                               variable=self.del_var,
                                               command=self.on_check_del)
        self.chk_delete_temp.pack(pady=(10, 0), padx=20, anchor="w")
        self.chk_audio = ttk.Checkbutton(tab, text=Strings.Current.FIX_AUDIO_CHECK_BOX_TITLE,
                                         variable=self.audio_fix_var,
                                         command=self.on_check_audio)
        self.chk_audio.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_replace = ttk.Checkbutton(tab, text=Strings.Current.REPLACE_APK_CHECK_BOX_TITLE,
                                           variable=self.replace_apks_var,
                                           command=self.on_check_replace_apks)
        self.chk_replace.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_format_userdata = ttk.Checkbutton(tab,
                                                   text=Strings.Current.FORMAT_USER_DATA_CHECK_BOX_TITLE,
                                                   variable=self.format_userdata_var,
                                                   command=self.on_check_format_user_data)
        self.chk_format_userdata.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_extend = ttk.Checkbutton(tab,
                                          text=Strings.Current.EXTEND_USER_DATA_CHECK_BOX_TITLE,
                                          variable=self.extend_user_data_var,
                                          command=self.on_check_extend_user_data)
        self.chk_extend.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_full = ttk.Checkbutton(tab, text=Strings.Current.CHECK_FULL_TITLE,
                                        variable=self.full_var,
                                        command=self.on_check_full)
        self.chk_full.pack(pady=(8, 0), padx=20, anchor="w")
        self.chk_partial = ttk.Checkbutton(tab, text=Strings.Current.CHECK_PARTIAL_TITLE,
                                           variable=self.partial_var,
                                           command=self.on_check_partial)
        self.chk_partial.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_minimal = ttk.Checkbutton(tab, text=Strings.Current.CHECK_MINIMAL_TITLE,
                                           variable=self.minimal_var,
                                           command=self.on_check_minimal)
        self.chk_minimal.pack(pady=(8, 0), padx=20, anchor="w")

        self.console = scrolledtext.ScrolledText(
            tab,
            wrap=tk.WORD,
            font=("Consolas", 10),
            insertbackground="white",
            state='disabled'
        )
        self.console.pack(fill="both", padx=(20, 20), pady=(10, 10), expand=True)
        standard_size = MainSystemTool.check_image_has_size(GlobalUI.user_file, "super", SuperTool.STANDARD_SUPER_SIZE)
        if standard_size or user_size < 7818182656:
            self.chk_extend['state'] = 'disabled'


    def check_apps(self):
        if not os.path.exists(GlobalUI.apps_folder):
            MissedAppsPopup(self.parent.parent)
            return False
        missed_app = MainTab.check_apks()
        if missed_app is not None:
            if missed_app == GlobalUI.applauncher:
                ...
            else:
                missed_app = Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT3.replace("{%s1}", missed_app)
            MissedAppsPopup(self.parent.parent, missed_app=missed_app, height=250)
            return False
        return True

    def proceed(self):
        if not self.check_apps():
            return
        self.run = True
        def run_fix():
            try:
                self.clear_console()
                self.cancel_btn['state'] = 'disabled'
                self.proceed_btn['state'] = 'disabled'
                self.chk_delete_temp['state'] = 'disabled'
                self.chk_audio['state'] = 'disabled'
                self.chk_format_userdata['state'] = 'disabled'
                self.chk_replace['state'] = 'disabled'
                self.chk_full['state'] = 'disabled'
                self.chk_partial['state'] = 'disabled'
                self.chk_minimal['state'] = 'disabled'
                self.chk_extend['state'] = 'disabled'
                self.parent.enable_only_tab(self.tab_num)
                self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_PROGRESS)
                self.parent.top.protocol("WM_DELETE_WINDOW", lambda: None)
                pipe = UIPipeline(self.audio_fix, self.remove_temps, self.replace_apks, self.format_userdata, self.extend_userdata, self.get_installation_type(), self.write)
                status = pipe.start()
                if status:
                    self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_SUCCESS)
                else:
                    self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_FAIL)
            except Exception as e:
                self.write(e)
                self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_FAIL)
            finally:
                self.run = False
                self.cancel_btn['state'] = 'normal'
                self.cancel_btn.configure(text=Strings.Current.DIALOG_DONE)
                self.parent.top.protocol("WM_DELETE_WINDOW", self.cancel)
                self.parent.enable_all_tabs()

        def run_time():
            start_time = time.perf_counter()
            while self.run:
                time.sleep(1)
                self.time_label.config(text=GlobalUI.get_time(start_time))

        threading.Thread(target=run_fix, daemon=True).start()
        threading.Thread(target=run_time, daemon=True).start()

    def get_installation_type(self):
        if self.minimal:
            return 2
        if self.partial:
            return 1
        if self.full:
            return 0
        return 2

    def cancel(self):
        self.parent.cancel()

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

    def on_check_replace_apks(self):
        if str(self.replace_apks_var.get()) == '1':
            self.replace_apks = True
        else:
            self.replace_apks = False

    def on_check_full(self):
        if str(self.full_var.get()) == '0':
            self.full_var.set(1)
            return
        self.full = True
        self.partial = False
        self.minimal = False
        self.partial_var.set(0)
        self.minimal_var.set(0)

    def on_check_partial(self):
        if str(self.partial_var.get()) == '0':
            self.partial_var.set(1)
            return
        self.full = False
        self.partial = True
        self.minimal = False
        self.full_var.set(0)
        self.minimal_var.set(0)

    def on_check_minimal(self):
        if str(self.minimal_var.get()) == '0':
            self.minimal_var.set(1)
            return
        self.full = False
        self.partial = False
        self.minimal = True
        self.full_var.set(0)
        self.partial_var.set(0)

    def on_check_format_user_data(self):
        if str(self.format_userdata_var) == '1':
            self.format_userdata = True
        else:
            self.format_userdata = False

    def write(self, *messages):
        text = ""
        for msg in messages:
            text += str(msg)
            text += " "
        self.console.configure(state='normal')
        self.console.insert(tk.END, text + "\n")
        self.console.see(tk.END)
        self.console.configure(state='disabled')

    def clear_console(self):
        self.console.configure(state='normal')
        self.console.delete('1.0', tk.END)
        self.console.configure(state='disabled')

    def on_check_extend_user_data(self):
        if str(self.extend_user_data_var.get()) == '1':
            self.extend_userdata = True
            self.chk_format_userdata['state'] = 'disabled'
            self.format_userdata_var.set('1')
            self.format_userdata = True
        else:
            self.chk_format_userdata['state'] = 'normal'
            self.extend_userdata = False

    @staticmethod
    def check_apks():
        def apk_path_exists(apk_name, folder):
            return os.path.exists(GlobalUI.apps_folder + os.sep + folder + os.sep + apk_name + ".apk")

        apps = ["aida", "citra", "cpuz", "dolphin", "retroarch64"]
        apks = ["emu", "n64", "NetherSX2", "RetroArch_ra32", "totalcommander"]
        for apk in apks:
            if not apk_path_exists(apk, "Standard"):
                return apk
        for apk in apps:
            if not apk_path_exists(apk, "SD"):
                return apk
        if not os.path.exists(GlobalUI.applauncher_path):
            return GlobalUI.applauncher
        return None