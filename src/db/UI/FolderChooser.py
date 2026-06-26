from tkinter import ttk
from tkinter import filedialog
import tkinter as tk

from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Strings import Strings


class FolderChooser:

    def __init__(self, root, parent):
        self.__root = root
        self.__parent = parent
        self.__path = ""
        self.__choose_listener = lambda path: 0

        frame = ttk.Frame(parent)
        frame.pack(fill="both", expand=True, padx=0, pady=0)
        frame.grid_columnconfigure(0, weight=1, pad=0)
        frame.grid_columnconfigure(1, weight=20, pad=0)
        frame.grid_columnconfigure(2, weight=1, pad=0)
        frame.grid_rowconfigure(0, weight=1, pad=2)
        frame.grid_rowconfigure(1, weight=1, pad=2)
        frame.grid_rowconfigure(2, weight=1, pad=2)

        entry_path = tk.Entry(frame, width=80, font=("Segoe UI", 10))
        entry_path.grid(row=1, column=0, columnspan=1, sticky="nsew", padx=2, pady=2)
        entry_path.config(state="readonly", takefocus=0)
        entry_path.bind("<Button-1>", lambda e: "break")
        entry_path.bind("<FocusIn>", lambda e: "break")
        FolderChooser.set_text(entry_path, Strings.Current.DB_FOLDER_ICON)
        def choose_folder():
            folder_path = filedialog.askdirectory(
                title=Strings.Current.SD_PATH_TITLE,
                initialdir=GlobalUI.initial_dir
            )

            if folder_path:
                self.__path = folder_path
                GlobalUI.initial_dir = folder_path
                label = Strings.Current.DB_FOLDER_ICON + "  " + folder_path + "/" + GlobalUI.db_name
                FolderChooser.set_text(entry_path, label)

                label = Strings.Current.DB_FOLDER_ICON + "  " + folder_path + "/" + GlobalUI.new_db_name
                FolderChooser.set_text(entry_path5, label)

                label = Strings.Current.GAMES_FOLDER_ICON + "  " + folder_path + "/" + GlobalUI.game_folder_name
                FolderChooser.set_text(entry_path2, label)

                label = Strings.Current.IMAGES_FOLDER_ICON + "  " + folder_path + "/" + GlobalUI.game_folder_name + "/platform/" + GlobalUI.image_folder_name
                FolderChooser.set_text(entry_path3, label)

                label = Strings.Current.IMAGES_FOLDER_ICON + "  " + folder_path + "/" + GlobalUI.game_folder_name + "/platform/" + GlobalUI.image_media_folder_name
                FolderChooser.set_text(entry_path4, label)
                self.__choose_listener(folder_path)

        btn_browse = ttk.Button(frame, text=Strings.Current.SD_CARD_BUTTON_TITLE, command=choose_folder)
        btn_browse.grid(row=0, column=2, sticky="nsew", padx=2, pady=0)

        entry_path2 = tk.Entry(frame, width=80, font=("Segoe UI", 10))
        entry_path2.grid(row=0, column=0, columnspan=2, sticky="nsew", padx=2, pady=2)
        entry_path2.config(state="readonly", takefocus=0)
        entry_path2.bind("<Button-1>", lambda e: "break")
        entry_path2.bind("<FocusIn>", lambda e: "break")
        FolderChooser.set_text(entry_path2, Strings.Current.GAMES_FOLDER_ICON)

        entry_path3 = tk.Entry(frame, width=80, font=("Segoe UI", 10))
        entry_path3.grid(row=2, column=0, columnspan=1, sticky="nsew", padx=2, pady=2)
        entry_path3.config(state="readonly", takefocus=0)
        entry_path3.bind("<Button-1>", lambda e: "break")
        entry_path3.bind("<FocusIn>", lambda e: "break")
        FolderChooser.set_text(entry_path3, Strings.Current.IMAGES_FOLDER_ICON)

        entry_path4 = tk.Entry(frame, width=80, font=("Segoe UI", 10))
        entry_path4.grid(row=2, column=1, columnspan=2, sticky="nsew", padx=2, pady=2)
        entry_path4.config(state="readonly", takefocus=0)
        entry_path4.bind("<Button-1>", lambda e: "break")
        entry_path4.bind("<FocusIn>", lambda e: "break")
        FolderChooser.set_text(entry_path4, Strings.Current.IMAGES_FOLDER_ICON)

        entry_path5 = tk.Entry(frame, width=80, font=("Segoe UI", 10))
        entry_path5.grid(row=1, column=1, columnspan=2, sticky="nsew", padx=2, pady=2)
        entry_path5.config(state="readonly", takefocus=0)
        entry_path5.bind("<Button-1>", lambda e: "break")
        entry_path5.bind("<FocusIn>", lambda e: "break")
        FolderChooser.set_text(entry_path5, Strings.Current.DB_FOLDER_ICON)
        # label1 = ttk.Label(frame, text=Strings.Current.DB_FOLDER_ICON, font=("Segoe UI", 10), justify="left")
        # label1.grid(row=0, column=0, sticky="nsew", padx=(5, 0), pady="5")

        # label2 = ttk.Label(frame, text=Strings.Current.GAMES_FOLDER_ICON, font=("Calibri", 10), justify="left")
        # label2.grid(row=1, column=0, sticky="nsew", padx=(5, 0), pady="5")

        # label3 = ttk.Label(frame, text=Strings.Current.IMAGES_FOLDER_ICON, font=("Helvetica", 10), justify="left")
        # label3.grid(row=2, column=0, sticky="nsew", padx=(5, 0), pady="5")

    @staticmethod
    def set_text(entry_path, text):
        entry_path.config(state="normal")
        entry_path.delete(0, tk.END)
        entry_path.insert(0, text)
        entry_path.config(state="readonly")

    def set_choose_listener(self, choose_listener):
        self.__choose_listener = choose_listener