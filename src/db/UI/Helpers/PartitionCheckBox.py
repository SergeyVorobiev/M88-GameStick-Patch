from tkinter import ttk

import tkinter as tk

from src.db.UI.GlobalUI import GlobalUI


class PartitionCheckBox:

    def __init__(self, parent, name, size, start_index, enabled, selectable):
        self.__name = name
        self.__size = size
        self.__start_index = start_index
        if enabled:
            self.__check_var = tk.Variable(value=1)
            self.__checked = True
        else:
            self.__check_var = tk.Variable(value=0)
            self.__checked = False
        self.row = ttk.Frame(parent)
        self.row.pack(expand=True, fill="both")
        self.row.grid_columnconfigure(0, pad=0, weight=1, minsize=200)
        self.row.grid_columnconfigure(1, pad=0, weight=1, minsize=200)
        self.row.grid_columnconfigure(2, pad=0, weight=1, minsize=200)
        self.check = ttk.Checkbutton(self.row, text=name,
                                           variable=self.__check_var,
                                           command=self.__select_command)
        self.check.grid(row=0, column=0, pady=(0, 0), sticky="w")

        self.offset_label = ttk.Label(self.row, text=str(start_index), font=("Consolas", 10))
        self.offset_label.grid(row=0, column=1, pady=(0, 0), sticky="e")
        if size == 0:
            size = "-"
        else:
            size = GlobalUI.format_size(size)
        self.size_label = ttk.Label(self.row, text=size, font=("Consolas", 10))
        self.size_label.grid(row=0, column=2, pady=(0, 0), sticky="e")

        if not selectable:
            self.check['state'] = 'disabled'
        self.__state_changed_listener = lambda: 0

    def get_name(self):
        return self.__name

    def get_size(self):
        return self.__size

    def is_checked(self):
        return self.__checked

    def __select_command(self):
        if str(self.__check_var.get()) == '1':
            self.__checked = True
        else:
            self.__checked = False
        self.__state_changed_listener()

    def set_state_changed_listener(self, state_changed_listener):
        self.__state_changed_listener = state_changed_listener
        return self

    def destroy(self):
        self.row.destroy()
