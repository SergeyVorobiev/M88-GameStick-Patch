import os
import threading
from pathlib import Path
from tkinter import ttk, scrolledtext
import tkinter as tk

from src.MT6768.Pipeline import Pipeline
from src.MainSystemTool import MainSystemTool
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.PartitionCheckBox import PartitionCheckBox
from src.db.UI.Helpers.ScrollableFrame import ScrollableFrame
from src.db.UI.Strings import Strings


class PartitionsTab:

    def __init__(self, parent, tab, tab_num):
        self.parent = parent
        self.tab = tab
        self.tab_num = tab_num

        self.msg_label = None
        self.inject_btn = None
        self.part_console = None
        self.partition_scroll_frame = None

        self.show_hidden_parts_var = tk.Variable(value=1)

        self.partition_check_boxes = {}
        self.super_partition_check_boxes = {}

        self.init_partitions_tab(self.tab)

    def init_partitions_tab(self, tab_parent):
        msg_label = ttk.Label(tab_parent, text=Strings.Current.PARTITIONS_NOTE_MESSAGE, font=("Consolas", 10),
                              wraplength=self.parent.width - 20,
                              justify="center")
        msg_label.pack(pady=(20, 5))
        war_label = ttk.Label(tab_parent, text=Strings.Current.PARTITIONS_WARNING, font=("Consolas", 10),
                              wraplength=self.parent.width - 20,
                              justify="center", foreground="#870000")
        war_label.pack(pady=(5, 5))

        path_label = ttk.Label(tab_parent, text=Strings.Current.IMAGE_PATH_TITLE + str(Path(GlobalUI.user_file).absolute()), font=("Consolas", 10),
                              wraplength=self.parent.width - 20,
                              justify="center")
        path_label.pack(pady=(10, 5), padx=(20, 0), anchor="w")

        chk_show_hidden_parts = ttk.Checkbutton(tab_parent, text=Strings.Current.PARTITIONS_SHOW_ALL_POSSIBLE_CHECK_BOX_TITLE,
                                               variable=self.show_hidden_parts_var,
                                               command=self.on_check_hidden_parts)
        chk_show_hidden_parts.pack(pady=(10, 0), padx=20, anchor="w")
        self.partition_scroll_frame = ScrollableFrame(tab_parent)
        self.partition_scroll_frame.pack(fill="both", expand=True)
        self.make_partitions_dicts()
        control_frame = ttk.Frame(tab_parent)
        control_frame.pack(expand=True)
        self.part_console = scrolledtext.ScrolledText(
            tab_parent,
            wrap=tk.WORD,
            font=("Consolas", 10),
            insertbackground="white",
            state='disabled'
        )
        self.part_console.pack(fill="both", padx=(20, 20), pady=(10, 10), expand=True)
        self.inject_btn = ttk.Button(control_frame, text=Strings.Current.DIALOG_INJECT, command=self.inject_image, width=12)
        self.inject_btn.pack(side="bottom", pady=(15, 10))
        is_partition_selected = self.check_partitions_selected()
        if not is_partition_selected:
            self.inject_btn['state'] = 'disabled'

    def make_partitions_dicts(self):
        all_items = str(self.show_hidden_parts_var.get()) == '1'
        result = MainSystemTool.get_image_list(GlobalUI.user_file)
        self.partition_scroll_frame.clear()
        new_boxes = {}
        for item in result:
            selectable = os.path.exists(item[0]) and os.path.getsize(item[0]) == item[2]
            if not selectable and not all_items:
                continue
            ch = self.partition_check_boxes.get(item[0])
            if ch is None:
                enabled = False
            else:
                enabled = ch.is_checked()
                ch.destroy()
            new_boxes[item[0]] = PartitionCheckBox(self.partition_scroll_frame.scrollable_frame, item[0], item[2],
                                                   item[1], enabled, selectable).set_state_changed_listener(self.partition_check_listener)
        self.partition_check_boxes = new_boxes

        new_super_partitions = {}
        def add_su_image(name):
            selec = os.path.exists(name)
            if not selec and not all_items:
                return
            che = self.super_partition_check_boxes.get(name)
            if che is None:
                enab = False
            else:
                enab = che.is_checked()
                che.destroy()
            new_super_partitions[name] = PartitionCheckBox(self.partition_scroll_frame.scrollable_frame,
                                                                       name, 0, "super.img", enab, selec).set_state_changed_listener(self.partition_check_listener)
        add_su_image("product_a.img")
        add_su_image("product_b.img")
        add_su_image("system_a.img")
        add_su_image("system_b.img")
        add_su_image("vendor_a.img")
        add_su_image("vendor_b.img")
        self.super_partition_check_boxes = new_super_partitions

    def check_partitions_selected(self):
        for item in self.partition_check_boxes.values():
            if item.is_checked():
                return True
        for item in self.super_partition_check_boxes.values():
            if item.is_checked():
                return True
        return False

    def partition_check_listener(self):
        is_partition_selected = self.check_partitions_selected()
        if not is_partition_selected:
            self.inject_btn['state'] = 'disabled'
        else:
            self.inject_btn['state'] = 'normal'

    def on_check_hidden_parts(self):
        self.make_partitions_dicts()

    def inject_image(self):
        printc = self.write_partitions_console
        def run_inject():
            try:
                self.clear_console()
                self.parent.top.protocol("WM_DELETE_WINDOW", lambda: None)
                self.inject_btn['state'] = 'disabled'
                self.parent.enable_only_tab(self.tab_num)
                for check_box in self.partition_check_boxes.values():
                    name = check_box.get_name()
                    enabled = os.path.exists(name) and os.path.getsize(name) == check_box.get_size()
                    if check_box.is_checked() and enabled:
                        printc(name)
                        Pipeline.inject_image_into_user(name, name, GlobalUI.user_file, printc)
                s_images = {}
                for check_box in self.super_partition_check_boxes.values():
                    name = check_box.get_name()
                    if check_box.is_checked():
                        s_images[name[:-4]] = name
                if len(s_images) > 0:
                    Pipeline.inject_s_image_into_user(s_images, GlobalUI.user_file, "",
                                                      GlobalUI.exec_folder + "/lpunpack.exe",
                                                      GlobalUI.exec_folder + "/lpmake.exe", printc)
                printc("\nInjecting is finished")
            except Exception as e:
                printc(e)
                printc("\nInjecting is failed")
            finally:
                self.inject_btn['state'] = 'normal'
                self.parent.top.protocol("WM_DELETE_WINDOW", self.cancel)
                self.parent.enable_all_tabs()

        threading.Thread(target=run_inject, daemon=True).start()

    def write_partitions_console(self, *messages):
        text = ""
        for msg in messages:
            text += str(msg)
            text += " "
        self.part_console.configure(state='normal')
        self.part_console.insert(tk.END, text + "\n")
        self.part_console.see(tk.END)
        self.part_console.configure(state='disabled')

    def cancel(self):
        self.parent.cancel()

    def clear_console(self):
        self.part_console.configure(state='normal')
        self.part_console.delete('1.0', tk.END)
        self.part_console.configure(state='disabled')