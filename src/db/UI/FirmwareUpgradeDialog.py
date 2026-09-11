import os.path
import shutil
import threading
import time
import tkinter as tk
from tkinter import ttk, scrolledtext

from src.MT6768.UIPipeline import UIPipeline
from src.OtherTool import OtherTool
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.ClickableLink import ClickableLink
from src.db.UI.Strings import Strings


class FirmwareUpgradeDialog:
    def __init__(self, parent,
                 title=Strings.Current.DIALOG_ATTENTION,
                 width = 900,
                 height = 700):
        self.parent = parent
        self.free_space = 30 # GB
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
        self.replace_apks = True
        self.full = True
        self.partial = False
        self.minimal = False
        self.run = False
        self.msg_label = None
        self.proceed_btn =None
        self.cancel_btn = None
        self.console = None
        self.time_label = None
        self.status_label = None
        self.chk_delete_temp = None
        self.chk_audio = None
        self.chk_replace = None
        self.chk_full = None
        self.chk_partial = None
        self.chk_minimal = None
        self.del_var = tk.Variable(value=1)
        self.audio_fix_var = tk.Variable(value=1)
        self.replace_apks_var = tk.Variable(value=1)
        self.full_var = tk.Variable(value=1)
        self.partial_var = tk.Variable(value=0)
        self.minimal_var = tk.Variable(value=0)
        state, result = self.check_state()
        if state == 0:
            self.layout_0()
        elif state == 1:
            self.layout_1()
        elif state == 2:
            self.layout_2()
        elif state == 3:
            result = Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT3.replace("{%s1}", result)
            self.layout_3(result)
        elif state == 4:
            self.layout_3(Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT4 + "M88FW!")
        else:
            self.layout_4()

        self.top.focus_force()
        self.top.update_idletasks()

    def layout_2(self):
        self.width = 300
        self.height = 120
        self.center_window(self.parent)

        msg_label = ttk.Label(self.top, text=Strings.Current.NOT_ENOUGH_SPACE_MESSAGE, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))

        btn_frame = ttk.Frame(self.top)
        btn_frame.pack(side="bottom", pady=15)
        cancel_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_CANCEL, command=self.cancel, width=12)
        cancel_btn.pack(padx=8)

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

    def format_size(self, size):
        for unit in ['B', 'KB']:
            if size < 1024:
                return str(int(size)) + unit
            size /= 1024
        return str(int(size)) + " MB"

    def layout_4(self):
        user_size = os.path.getsize(GlobalUI.user_file)
        btn_frame = ttk.Frame(self.top)
        btn_frame.pack(side="bottom", pady=(10, 15))
        self.proceed_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_START, command=self.proceed, width=12)
        self.proceed_btn.pack(side="left", padx=8)
        self.cancel_btn = ttk.Button(btn_frame, text=Strings.Current.DIALOG_CANCEL, command=self.cancel, width=12)
        self.cancel_btn.pack(side="right", padx=8)
        lab_frame = ttk.Frame(self.top)
        lab_frame.pack(side="bottom", pady=0)
        lab_frame.grid_rowconfigure(0, pad=0)
        lab_frame.grid_rowconfigure(1, pad=0)

        control_frame = ttk.Frame(self.top)
        control_frame.pack(side="top", pady=(10, 0), padx=(20, 0), anchor="w")

        self.time_label = ttk.Label(lab_frame, text="00:00", font=("Consolas", 10), wraplength=self.width - 20,
                                  justify="center")
        self.time_label.grid(row=0, column=0, pady=(0, 0))

        self.status_label = ttk.Label(lab_frame, text=Strings.Current.UPGRADE_STATUS_LABEL_START, font=("Consolas", 10), wraplength=self.width - 20,
                                    justify="center")
        self.status_label.grid(row=1, column=0, pady=(5, 0))

        size_label = ttk.Label(control_frame, text=Strings.Current.IMAGE_SIZE_TITLE + self.format_size(user_size), font=("Consolas", 10), wraplength=self.width - 20,
                                    justify="left")
        size_label.pack(side="left", pady=(0, 0))

        self.chk_delete_temp = ttk.Checkbutton(self.top, text=Strings.Current.REMOVE_TEMP_CHECK_BOX_TITLE,
                                          variable=self.del_var,
                                          command=self.on_check_del)
        self.chk_delete_temp.pack(pady=(10, 0), padx=20, anchor="w")
        self.chk_audio = ttk.Checkbutton(self.top, text=Strings.Current.FIX_AUDIO_CHECK_BOX_TITLE,
                                          variable=self.audio_fix_var,
                                          command=self.on_check_audio)
        self.chk_audio.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_replace = ttk.Checkbutton(self.top, text=Strings.Current.REPLACE_APK_CHECK_BOX_TITLE,
                                    variable=self.replace_apks_var,
                                    command=self.on_check_replace_apks)
        self.chk_replace.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_full = ttk.Checkbutton(self.top, text=Strings.Current.CHECK_FULL_TITLE,
                                      variable=self.full_var,
                                      command=self.on_check_full)
        self.chk_full.pack(pady=(8, 0), padx=20, anchor="w")
        #if user_size < 7818182656:
        #    self.chk_full['state'] = 'disabled'
        self.chk_partial = ttk.Checkbutton(self.top, text=Strings.Current.CHECK_PARTIAL_TITLE,
                                      variable=self.partial_var,
                                      command=self.on_check_partial)
        self.chk_partial.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_minimal = ttk.Checkbutton(self.top, text=Strings.Current.CHECK_MINIMAL_TITLE,
                                      variable=self.minimal_var,
                                      command=self.on_check_minimal)
        self.chk_minimal.pack(pady=(8, 0), padx=20, anchor="w")

        self.console = scrolledtext.ScrolledText(
            self.top,
            wrap=tk.WORD,
            font=("Consolas", 10),
            insertbackground="white",
            state='disabled'
        )
        self.console.pack(fill="both", padx=(20, 20), pady=(10,10), expand=True)

    def layout_3(self, message):
        self.width = 300
        self.height = 200
        self.center_window(self.parent)

        msg_label = ttk.Label(self.top, text=message, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))

        msg_label = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT2, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))

        link = ClickableLink(self.top,
                             text=Strings.Current.M88FW_LABEL,
                             url=GlobalUI.m88fw_url)
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

    @staticmethod
    def get_time(start_time):
        end_time = time.perf_counter()
        elapsed = end_time - start_time
        minutes = int(elapsed // 60)
        seconds = int(elapsed % 60)
        return f"{minutes:02d}:{seconds:02d}"

    def check_state(self):
        if not os.path.exists(GlobalUI.firmware_folder):
            return 0, None
        if not os.path.exists(GlobalUI.user_file):
            return 1, None
        free_gb = shutil.disk_usage(os.getcwd()).free / (1024 ** 3)
        if free_gb < self.free_space:
            return 2, None
        apk = self.check_apks()
        if apk is not None:
            return 3, apk
        ver = self.check_version()
        if not ver:
            return 4, None
        return 5, None

    def check_apks(self):
        def apk_path_exists(apk_name, folder):
            return os.path.exists(GlobalUI.firmware_folder + os.sep + "replace" + os.sep + folder + os.sep + apk_name + ".apk")
        apps = ["aida", "citra", "cpuz", "dolphin", "retroarch64"]
        apks = ["applauncher", "emu", "n64", "NetherSX2", "RetroArch_ra32", "totalcommander"]
        for apk in apks:
            if not apk_path_exists(apk, "apk"):
                return apk
        for apk in apps:
            if not apk_path_exists(apk, "Apps"):
                return apk
        return None

    def check_version(self):
        ver_path = GlobalUI.firmware_folder + os.sep + "exec" + os.sep + "fw_ver"
        result = os.path.exists(ver_path)
        if not result:
            return result
        lines = OtherTool.read_file_lines(ver_path)
        if len(lines) == 0:
            return False
        ver = lines[0]
        return GlobalUI.supported_firmware_versions.__contains__(ver)

    def center_window(self, parent):
        self.top.update_idletasks()
        x = parent.winfo_x() + (parent.winfo_width() // 2) - self.width // 2
        y = parent.winfo_y() + (parent.winfo_height() // 2) - self.height // 2
        self.top.geometry(f"{self.width}x{self.height}+{x}+{y}")

    def get_installation_type(self):
        if self.minimal:
            return 2
        if self.partial:
            return 1
        if self.full:
            return 0
        return 2

    def proceed(self):
        self.run = True
        def run_fix():
            try:
                self.cancel_btn['state'] = 'disabled'
                self.proceed_btn['state'] = 'disabled'
                self.chk_delete_temp['state'] = 'disabled'
                self.chk_audio['state'] = 'disabled'
                self.chk_replace['state'] = 'disabled'
                self.chk_full['state'] = 'disabled'
                self.chk_partial['state'] = 'disabled'
                self.chk_minimal['state'] = 'disabled'
                self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_PROGRESS)
                self.top.protocol("WM_DELETE_WINDOW", lambda: None)
                pipe = UIPipeline(self.audio_fix, self.remove_temps, self.replace_apks, self.get_installation_type(), self.write)
                status = pipe.start()
                if status:
                    self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_SUCCESS)
                else:
                    self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_FAIL)
            finally:
                self.run = False
                self.cancel_btn['state'] = 'normal'
                self.cancel_btn.configure(text=Strings.Current.DIALOG_DONE)
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