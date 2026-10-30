import os
import threading
import time
from pathlib import Path
from tkinter import ttk, scrolledtext
import tkinter as tk

from src.MT6768.UIPipelineGSI import UIPipelineGSI
from src.MainSystemTool import MainSystemTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Strings import Strings


class GSITab:

    def __init__(self, parent, tab, tab_num):
        self.parent = parent
        self.tab = tab
        self.tab_num = tab_num

        self.run =False
        self.audio_fix_gsi = True
        self.kernel_fix = True
        self.keychars_fix_gsi = True
        self.format_userdata_gsi = True
        self.extend_userdata = False

        self.proceed_btn_gsi = None
        self.console_gsi = None
        self.chk_audio_gsi = None
        self.chk_kernel_fix = None
        self.chk_format_userdata_gsi = None
        self.chk_keychars_gsi = None
        self.time_label_gsi = None
        self.status_label_gsi = None
        self.chk_extend = None

        self.keychars_fix_var_gsi = tk.Variable(value=1)
        self.format_userdata_var_gsi = tk.Variable(value=1)
        self.audio_fix_var_gsi = tk.Variable(value=1)
        self.kernel_fix_var = tk.Variable(value=1)
        self.extend_user_data_var = tk.Variable(value=0)

        self.init_gsi_tab(self.tab)

    def init_gsi_tab(self, tab_parent):
        msg_label = ttk.Label(tab_parent, text=Strings.Current.GSI_TITLE, font=("Consolas", 10),
                              justify="center")
        msg_label.pack(pady=(20, 5))
        user_size = os.path.getsize(GlobalUI.user_file)
        standard_size = MainSystemTool.check_image_has_size(GlobalUI.user_file, "super", SuperTool.STANDARD_SUPER_SIZE)
        small = user_size < 6818182656 # 4GB version is not supported
        not_system = False
        if not os.path.exists("system_a.img"):
            not_system = True
        btn_frame = ttk.Frame(tab_parent)
        btn_frame.pack(side="bottom", pady=(10, 15))
        lab_frame = ttk.Frame(tab_parent)
        self.proceed_btn_gsi = ttk.Button(btn_frame, text=Strings.Current.DIALOG_START, command=self.proceed_gsi, width=12)
        self.proceed_btn_gsi.pack(side="left", padx=8)
        lab_frame.pack(side="bottom", pady=0)
        lab_frame.grid_rowconfigure(0, pad=0)
        lab_frame.grid_rowconfigure(1, pad=0)
        control_frame = ttk.Frame(tab_parent)
        control_frame.pack(side="top", pady=(10, 0), padx=(20, 0), anchor="w")
        control_frame.grid_rowconfigure(0, pad=0)
        control_frame.grid_rowconfigure(1, pad=0)
        user_label = ttk.Label(control_frame,
                               text=Strings.Current.IMAGE_PATH_TITLE + str(Path(GlobalUI.user_file).absolute()),
                               font=("Consolas", 10), wraplength=self.parent.width - 20, justify="left")
        user_label.grid(row=0, column=0, pady=(5, 0))
        size_text = Strings.Current.IMAGE_SIZE_TITLE + GlobalUI.format_size(user_size, "MB")
        if small:
            size_text = size_text + " " + Strings.Current.IMAGE_SIZE_DOES_NOT_FIT_TEXT
        size_label = ttk.Label(control_frame,
                               text=size_text,
                               font=("Consolas", 10), wraplength=self.parent.width - 20,
                               justify="left")
        size_label.grid(row=1, column=0, pady=(10, 5), sticky="w")

        self.chk_audio_gsi = ttk.Checkbutton(tab_parent, text=Strings.Current.FIX_AUDIO_CHECK_BOX_TITLE,
                                         variable=self.audio_fix_var_gsi,
                                         command=self.on_check_audio_gsi)
        self.chk_audio_gsi.pack(pady=(8, 0), padx=20, anchor="w")
        #self.chk_kernel_fix = ttk.Checkbutton(tab_parent, text=Strings.Current.FIX_KERNEL_CHECK_BOX_TITLE,
        #                                 variable=self.kernel_fix_var,
        #                                 command=self.on_check_kernel_fix)
        #self.chk_kernel_fix.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_format_userdata_gsi = ttk.Checkbutton(tab_parent, text=Strings.Current.FORMAT_USER_DATA_CHECK_BOX_TITLE,
                                              variable=self.format_userdata_var_gsi,
                                              command=self.on_check_format_user_data_gsi)
        self.chk_format_userdata_gsi.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_extend = ttk.Checkbutton(tab_parent,
                                                       text=Strings.Current.EXTEND_USER_DATA_CHECK_BOX_TITLE,
                                                       variable=self.extend_user_data_var,
                                                       command=self.on_check_extend_user_data)
        self.chk_extend.pack(pady=(8, 0), padx=20, anchor="w")

        self.chk_keychars_gsi = ttk.Checkbutton(tab_parent, text=Strings.Current.FIX_GAMEPAD_BUTTONS,
                                              variable=self.keychars_fix_var_gsi,
                                              command=self.on_check_keychars_gsi)
        self.chk_keychars_gsi.pack(pady=(8, 0), padx=20, anchor="w")

        self.time_label_gsi = ttk.Label(lab_frame, text="00:00", font=("Consolas", 10), wraplength=self.parent.width - 20,
                                    justify="center")
        self.time_label_gsi.grid(row=0, column=0, pady=(0, 0))

        self.status_label_gsi = ttk.Label(lab_frame, text=Strings.Current.UPGRADE_STATUS_LABEL_START, font=("Consolas", 10),
                                      wraplength=self.parent.width - 20,
                                      justify="center")
        self.status_label_gsi.grid(row=1, column=0, pady=(5, 0))

        self.console_gsi = scrolledtext.ScrolledText(
            tab_parent,
            wrap=tk.WORD,
            font=("Consolas", 10),
            insertbackground="white",
            state='disabled'
        )
        self.console_gsi.pack(fill="both", padx=(20, 20), pady=(10, 10), expand=True)
        if standard_size:
            self.chk_extend['state'] = 'disabled'
        if small or not_system:
            self.chk_audio_gsi['state'] = 'disabled'
            self.chk_kernel_fix['state'] = 'disabled'
            self.proceed_btn_gsi['state'] = 'disabled'
            self.chk_format_userdata_gsi['state'] = 'disabled'
            self.chk_keychars_gsi['state'] = 'disabled'
            self.chk_extend['state'] = 'disabled'
            if small:
                self.status_label_gsi['text'] = Strings.Current.GSI_STATUS_WRONG_IMAGE
            else:
                self.status_label_gsi['text'] = Strings.Current.GSI_NOT_SYSTEM_IMAGE

    def proceed_gsi(self):
        def run_fix():
            try:
                self.run = True
                self.clear_console()
                self.status_label_gsi.config(text=Strings.Current.UPGRADE_STATUS_LABEL_PROGRESS)
                self.parent.top.protocol("WM_DELETE_WINDOW", lambda: None)
                self.parent.enable_only_tab(self.tab_num)
                self.chk_audio_gsi['state'] = 'disabled'
                self.chk_kernel_fix['state'] = 'disabled'
                self.proceed_btn_gsi['state'] = 'disabled'
                self.chk_format_userdata_gsi['state'] = 'disabled'
                self.chk_keychars_gsi['state'] = 'disabled'
                self.chk_extend['state'] = 'disabled'
                status = UIPipelineGSI(self.audio_fix_gsi, self.kernel_fix, self.format_userdata_gsi, self.keychars_fix_gsi, self.extend_userdata, self.write_gsi_console).start()
                if status:
                    self.status_label_gsi.config(text=Strings.Current.UPGRADE_STATUS_LABEL_SUCCESS)
                else:
                    self.status_label_gsi.config(text=Strings.Current.UPGRADE_STATUS_LABEL_FAIL)
            except Exception as e:
                self.write_gsi_console(e)
                self.status_label_gsi.config(text=Strings.Current.UPGRADE_STATUS_LABEL_FAIL)
            finally:
                self.run = False
                self.parent.enable_all_tabs()
                self.parent.top.protocol("WM_DELETE_WINDOW", self.cancel)
                self.proceed_btn_gsi.configure(text=Strings.Current.DIALOG_DONE)

        def run_time():
            start_time = time.perf_counter()
            while self.run:
                time.sleep(1)
                self.time_label_gsi.config(text=GlobalUI.get_time(start_time))

        threading.Thread(target=run_fix, daemon=True).start()
        threading.Thread(target=run_time, daemon=True).start()

    def on_check_audio_gsi(self):
        if str(self.audio_fix_var_gsi.get()) == '1':
            self.audio_fix_gsi = True
        else:
            self.audio_fix_gsi = False

    def on_check_keychars_gsi(self):
        if str(self.keychars_fix_var_gsi.get()) == '1':
            self.keychars_fix_gsi = True
        else:
            self.keychars_fix_gsi = False

    def on_check_format_user_data_gsi(self):
        if str(self.format_userdata_var_gsi.get()) == '1':
            self.format_userdata_gsi = True
        else:
            self.format_userdata_gsi = False

    def on_check_extend_user_data(self):
        if str(self.extend_user_data_var.get()) == '1':
            self.extend_userdata = True
            self.chk_format_userdata_gsi['state'] = 'disabled'
            self.format_userdata_var_gsi.set('1')
            self.format_userdata_gsi = True
        else:
            self.chk_format_userdata_gsi['state'] = 'normal'
            self.extend_userdata = False

    def on_check_kernel_fix(self):
        if str(self.kernel_fix_var.get()) == '1':
            self.kernel_fix = True
        else:
            self.kernel_fix = False

    def cancel(self):
        self.parent.cancel()

    def clear_console(self):
        self.console_gsi.configure(state='normal')
        self.console_gsi.delete('1.0', tk.END)
        self.console_gsi.configure(state='disabled')

    def write_gsi_console(self, *messages):
        text = ""
        for msg in messages:
            text += str(msg)
            text += " "
        self.console_gsi.configure(state='normal')
        self.console_gsi.insert(tk.END, text + "\n")
        self.console_gsi.see(tk.END)
        self.console_gsi.configure(state='disabled')