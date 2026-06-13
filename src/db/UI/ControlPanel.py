from tkinter import ttk

from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Strings import Strings


class ControlPanel:

    def __init__(self, root, parent):
        self.__root = root
        self.__parent = parent
        for i in range(7):
            parent.grid_columnconfigure(i, weight=1, pad=0)

        self.btn1 = ttk.Button(parent, text=Strings.Current.SAVE_DB_BUTTON_TITLE, width=20)
        self.btn2 = ttk.Button(parent, text=Strings.Current.SELECT_ALL_BUTTON_TITLE, width=20)
        self.btn3 = ttk.Button(parent, text=Strings.Current.DESELECT_ALL_BUTTON_TITLE, width=20)
        self.btn4 = ttk.Button(parent, text=Strings.Current.ERASE_FAVORITES_BUTTON_TITLE, width=20)
        self.btn5 = ttk.Button(parent, text=Strings.Current.ERASE_HISTORY_BUTTON_TITLE, width=20)
        self.btn6 = ttk.Button(parent, text=Strings.Current.CLEAN_GAME_FOLDERS_BUTTON_TITLE, width=20)
        self.btn7 = ttk.Button(parent, text=Strings.Current.CLEAN_IMAGE_FOLDERS_BUTTON_TITLE, width=20)
        self.btn8 = ttk.Button(parent, text=Strings.Current.FIRMWARE_BUTTON_TITLE + " " +  GlobalUI.fw_version, width=25)
        self.btn1.grid(row=0, column=0, pady=(0, 10))
        self.btn2.grid(row=0, column=1, pady=(0, 10))
        self.btn3.grid(row=0, column=2, pady=(0, 10))
        self.btn4.grid(row=0, column=3, pady=(0, 10))
        self.btn5.grid(row=0, column=4, pady=(0, 10))
        self.btn6.grid(row=0, column=5, pady=(0, 10))
        self.btn7.grid(row=0, column=6, pady=(0, 10))
        self.btn8.grid(row=0, column=6, pady=(0, 10))
        self.__state_buttons('disabled')

    def set_generate_db_listener(self, generate_db_listener):
        self.btn1.configure(command=generate_db_listener)

    def disable_buttons(self):
        self.__state_buttons('disabled')

    def enable_buttons(self):
        self.__state_buttons('normal')

    def __state_buttons(self, state):
        self.btn1['state'] = state
        self.btn2['state'] = state
        self.btn3['state'] = state
        self.btn4['state'] = state
        self.btn5['state'] = state
        self.btn6['state'] = state
        self.btn7['state'] = state

    def set_select_all_listener(self, select_all_listener):
        self.btn2.configure(command=select_all_listener)

    def set_deselect_all_listener(self, deselect_all_listener):
        self.btn3.configure(command=deselect_all_listener)

    def set_erase_favorites_listener(self, erase_favorites_listener):
        self.btn4.configure(command=erase_favorites_listener)

    def set_erase_history_listener(self, erase_history_listener):
        self.btn5.configure(command=erase_history_listener)

    def set_clean_game_folder_listener(self, clean_game_folder_listener):
        self.btn6.configure(command=clean_game_folder_listener)

    def set_clean_image_folder_listener(self, clean_image_folder_listener):
        self.btn7.configure(command=clean_image_folder_listener)

    def set_upgrade_firmware_listener(self, upgrade_firmware_listener):
        self.btn8.configure(command=upgrade_firmware_listener)




