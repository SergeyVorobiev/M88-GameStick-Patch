import os.path
import threading
import time
from pathlib import Path
from tkinter import ttk, scrolledtext

from src.MT6768.UIPipelineExtendUD import UIPipelineExtendUD
from src.MainSystemTool import MainSystemTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Strings import Strings
import tkinter as tk


class ExtendUserDataTab:

    def __init__(self, parent, tab, tab_num):
        self.parent = parent
        self.tab = tab
        self.tab_num = tab_num

        self.run = False

        self.console = None
        self.extend_btn = None
        self.status_label = None
        self.time_label = None

        self.init_partitions_tab(tab)

    def init_partitions_tab(self, tab):
        user_size = os.path.getsize(GlobalUI.user_file)
        small = user_size < 6818182656  # 4GB version is not supported
        standard_size = MainSystemTool.check_image_has_size(GlobalUI.user_file, "super", SuperTool.STANDARD_SUPER_SIZE)
        msg_label = ttk.Label(tab, text=Strings.Current.EXTEND_UD_NOTE_MESSAGE, font=("Consolas", 10),
                              wraplength=self.parent.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))
        war_label = ttk.Label(tab, text=Strings.Current.PARTITIONS_WARNING, font=("Consolas", 10),
                              wraplength=self.parent.width - 20,
                              justify="center", foreground="#870000")
        war_label.pack(pady=(5, 5))

        path_label = ttk.Label(tab,
                               text=Strings.Current.IMAGE_PATH_TITLE + str(Path(GlobalUI.user_file).absolute()),
                               font=("Consolas", 10),
                               wraplength=self.parent.width - 20,
                               justify="center")
        path_label.pack(pady=(10, 5), padx=(20, 0), anchor="w")

        control_frame = ttk.Frame(tab)
        control_frame.pack(side="top", pady=(10, 0), padx=(20, 0), anchor="w")
        size_text = Strings.Current.IMAGE_SIZE_TITLE + GlobalUI.format_size(user_size, "MB")
        if small:
            size_text = size_text + " " + Strings.Current.IMAGE_SIZE_DOES_NOT_FIT_TEXT
        size_label = ttk.Label(control_frame,
                               text=size_text,
                               font=("Consolas", 10), wraplength=self.parent.width - 20,
                               justify="left")
        size_label.pack(side="left", pady=(0, 0))

        lab_frame = ttk.Frame(tab)
        lab_frame.pack(side="bottom", pady=0)
        lab_frame.grid_rowconfigure(0, pad=0)
        lab_frame.grid_rowconfigure(1, pad=0)
        control_frame = ttk.Frame(tab)
        control_frame.pack(expand=True)
        self.console = scrolledtext.ScrolledText(
            tab,
            wrap=tk.WORD,
            font=("Consolas", 10),
            insertbackground="white",
            state='disabled'
        )
        self.console.pack(fill="both", padx=(20, 20), pady=(10, 10), expand=True)

        self.time_label = ttk.Label(lab_frame, text="00:00", font=("Consolas", 10),
                                        wraplength=self.parent.width - 20,
                                        justify="center")
        self.time_label.grid(row=0, column=0, pady=(0, 0))

        self.status_label = ttk.Label(lab_frame, text=Strings.Current.UPGRADE_STATUS_LABEL_START,
                                          font=("Consolas", 10),
                                          wraplength=self.parent.width - 20,
                                          justify="center")
        self.status_label.grid(row=1, column=0, pady=(5, 20))
        self.extend_btn = ttk.Button(control_frame, text=Strings.Current.DIALOG_EXTEND_BTN, command=self.extend_image,
                                     width=12)
        self.extend_btn.pack(side="bottom", pady=(15, 10))
        if not small and not standard_size:
            self.extend_btn["state"] = tk.NORMAL
        else:
            self.extend_btn["state"] = tk.DISABLED
            if small:
                self.status_label["text"] = Strings.Current.UD_STATUS_WRONG_IMAGE
            else:
                self.status_label["text"] = Strings.Current.UD_STATUS_NORMAL_IMAGE

    def extend_image(self):
        standard_size = MainSystemTool.check_image_has_size(GlobalUI.user_file, "super", SuperTool.STANDARD_SUPER_SIZE)
        if standard_size:
            self.extend_btn["state"] = tk.DISABLED
            self.write_console("Already extended.")
            return
        def run_fix():
            try:
                self.run = True
                self.clear_console()
                self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_PROGRESS)
                self.parent.top.protocol("WM_DELETE_WINDOW", lambda: None)
                self.parent.enable_only_tab(self.tab_num)
                self.extend_btn['state'] = 'disabled'

                status = UIPipelineExtendUD(self.write_console).start()
                if status:
                    self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_SUCCESS)
                else:
                    self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_FAIL)
            except Exception as e:
                self.write_console(e)
                self.status_label.config(text=Strings.Current.UPGRADE_STATUS_LABEL_FAIL)
            finally:
                self.run = False
                self.parent.enable_all_tabs()
                self.parent.top.protocol("WM_DELETE_WINDOW", self.cancel)

        def run_time():
            start_time = time.perf_counter()
            while self.run:
                time.sleep(1)
                self.time_label.config(text=GlobalUI.get_time(start_time))

        threading.Thread(target=run_fix, daemon=True).start()
        threading.Thread(target=run_time, daemon=True).start()

    def cancel(self):
        self.parent.cancel()

    def clear_console(self):
        self.console.configure(state='normal')
        self.console.delete('1.0', tk.END)
        self.console.configure(state='disabled')

    def write_console(self, *messages):
        text = ""
        for msg in messages:
            text += str(msg)
            text += " "
        self.console.configure(state='normal')
        self.console.insert(tk.END, text + "\n")
        self.console.see(tk.END)
        self.console.configure(state='disabled')