import os.path
import shutil
import tkinter as tk
from tkinter import ttk
from src.OtherTool import OtherTool
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.ClickableLink import ClickableLink
from src.db.UI.FWTabs.ExtendUserDataTab import ExtendUserDataTab
from src.db.UI.FWTabs.GSITab import GSITab
from src.db.UI.FWTabs.MainTab import MainTab
from src.db.UI.FWTabs.PartitionsTab import PartitionsTab
from src.db.UI.FWTabs.SignFrameworkTab import SignFrameworkTab
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
        self.top.resizable(False, False)
        self.center_window(parent)
        self.top.iconbitmap(GlobalUI.icon)

        self.main_tab = None
        self.gsi_tab = None
        self.partitions_tab = None
        self.sign_tab = None
        self.eud_tab = None
        self.tab_nums = None
        self.notebook = None

        self.determine_layout()

        self.top.focus_force()
        self.top.update_idletasks()

    def determine_layout(self):
        state, result = self.check_state()
        if state == 0:
            self.layout_0()
        elif state == 1:
            self.layout_1()
        elif state == 2:
            self.layout_2()
        elif state == 3:
            self.layout_3()
        elif state == 4:
            result = Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT3.replace("{%s1}", result)
            self.layout_4(result)
        elif state == 5:
            self.layout_4(Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT4 + "M88FW!")
        else:
            self.layout_5()

    def enable_only_tab(self, tab_num):
        result = [item for item in self.tab_nums if item not in [tab_num]]
        self.disable_tabs(result)

    def disable_all_tabs(self):
        self.disable_tabs(self.tab_nums)

    def disable_tabs(self, tabs):
        for tab in tabs:
            self.notebook.tab(tab, state="disabled")

    def enable_all_tabs(self):
        self.enable_tabs(self.tab_nums)

    def enable_tabs(self, tabs):
        for tab in tabs:
            self.notebook.tab(tab, state="normal")

    # M88FW
    def layout_0(self):
        self.width = 300
        self.height = 220
        self.center_window(self.parent)

        msg_label = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT, font=("Consolas", 10), wraplength=self.width - 20,
                                   justify="center")
        msg_label.pack(pady=(20, 5))

        link = ClickableLink(self.top,
                             text=Strings.Current.M88FW_LABEL,
                             url=GlobalUI.m88fw_url)
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

    # Apps
    def layout_1(self):
        self.width = 300
        self.height = 200
        self.center_window(self.parent)

        msg_label = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT, font=("Consolas", 10), wraplength=self.width - 20,
                                   justify="center")
        msg_label.pack(pady=(20, 5))

        link = ClickableLink(self.top,
                             text=Strings.Current.APPS_LABEL,
                             url=GlobalUI.apps_url)
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

    # User image
    def layout_2(self):
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

    # Space
    def layout_3(self):
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

    # Version
    def layout_4(self, message):
        self.width = 300
        self.height = 280
        self.center_window(self.parent)

        msg_label = ttk.Label(self.top, text=message, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))
        req_message = GlobalUI.min_version + "+ " + Strings.Current.REQUIRED_WORD + "."
        req_label = ttk.Label(self.top, text=req_message, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        req_label.pack(pady=(5, 5))

        msg_label = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT2, font=("Consolas", 10),
                              wraplength=self.width - 20,
                              justify="center")
        msg_label.pack(pady=(10, 5))

        link = ClickableLink(self.top,
                             text=Strings.Current.M88FW_LABEL,
                             url=GlobalUI.m88fw_url)
        link.pack(pady=(5, 5))

        msg_label2 = ttk.Label(self.top, text=Strings.Current.DOWNLOAD_FW_ARCHIVE_TEXT5, font=("Consolas", 10),
                               wraplength=self.width - 20,
                               justify="center")
        msg_label2.pack(pady=(0, 5))

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

    def layout_5(self):
        self.notebook = ttk.Notebook(self.top)
        self.notebook.pack(expand=True, fill='both')
        tab1 = ttk.Frame(self.notebook)
        tab2 = ttk.Frame(self.notebook)
        tab3 = ttk.Frame(self.notebook)
        tab4 = ttk.Frame(self.notebook)
        tab5 = ttk.Frame(self.notebook)
        self.tab_nums = [0, 1, 2, 3, 4]
        self.notebook.add(tab1, text=Strings.Current.UPGRADE_MAIN_UI_TAB_TITLE)
        self.notebook.add(tab2, text=Strings.Current.UPGRADE_ANDROID_TAB_TITLE)
        self.notebook.add(tab3, text=Strings.Current.UPGRADE_USER_AREA_TAB_TITLE)
        self.notebook.add(tab4, text=Strings.Current.SIGN_FRAMEWORK_TAB_TITLE)
        self.notebook.add(tab5, text=Strings.Current.EXTEND_UD_TAB_TITLE)
        self.main_tab = MainTab(self, tab1, 0)
        self.gsi_tab = GSITab(self, tab2, 1)
        self.partitions_tab = PartitionsTab(self, tab3, 2)
        self.sign_tab = SignFrameworkTab(self, tab4, 3)
        self.eud_tab = ExtendUserDataTab(self, tab5, 4)
        self.notebook.pack(expand=True, fill="both", padx=0, pady=(10, 0))

    def cancel(self):
        self.top.destroy()

    def check_state(self):
        if not os.path.exists(GlobalUI.firmware_folder):
            return 0, None
        # if not os.path.exists(GlobalUI.apps_folder):
        #     return 1, None
        if not os.path.exists(GlobalUI.user_file):
            return 2, None
        free_gb = shutil.disk_usage(os.getcwd()).free / (1024 ** 3)
        if free_gb < self.free_space:
            return 3, None

        # apk = self.check_apks()
        # if apk is not None:
        #     return 4, apk
        ver = self.check_version()
        if not ver:
            return 5, None
        return 6, None

    @staticmethod
    def check_version():
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