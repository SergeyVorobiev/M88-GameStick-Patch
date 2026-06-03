import os
import tkinter as tk
from pathlib import Path
from tkinter import ttk
from PIL import Image, ImageTk

from src.db import PlatformsMeta
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.SimilarNames import SimilarNames
from src.db.UI.ProxyPopup import ProxyPopup
from src.db.UI.Strings import Strings


class ImagePreview:

    game_name = "Game name"
    index = "Num"
    def __init__(self, parent, table_item, num, image_path, image_name, file_name, ui_name, platform, on_reload_click_listener, on_picked_image_listener, on_save_art_listener):
        self.platform = platform
        self.top = tk.Toplevel(parent)
        self.table_item = table_item
        self.num = num
        self.parent = parent
        self.file_name = file_name
        self.ui_name = ui_name
        self.image_name = image_name
        self.image_path = image_path
        self.image_label = None
        self.reload_btn = None
        self.arts_list = None
        self.pick_btn = None
        self.back_btn = None
        self.save_new_art_btn = None
        self.set_proxy_btn = None
        self.loaded_image_buffer = None
        self.top.iconbitmap(GlobalUI.icon)
        #self.top.attributes("-alpha", 0.0)
        self.top.withdraw()
        self.width = 500
        self.button_area_height = 50
        self.photo = None
        self.picked_name = ""
        self.top.title(ui_name)
        self.top.transient(parent)
        self.top.resizable(False, False)

        self.build_image_view()
        self.top.grid_rowconfigure(0, weight=20, pad=0)
        self.top.grid_rowconfigure(1, weight=1, pad=0, minsize=35)
        self.top.grid_columnconfigure(0, weight=1, pad=0)
        self.top.grid_columnconfigure(1, weight=1, pad=0)
        self.top.bind("<Button-1>", self._close_on_outside_click, add=True)
        self.top.bind("<Button-3>", self._close_on_outside_click, add=True)
        self.top.bind("<Escape>", lambda e: self.top.destroy(), add=True)

        self.__on_reload_click_listener = on_reload_click_listener
        self.__on_picked_image_listener = on_picked_image_listener
        self.__on_save_art_click_listener = on_save_art_listener
        self.top.grab_set()
        self.top.focus_force()
        #self.top.attributes("-alpha", 1.0)
        self.top.deiconify()
        self.top.update_idletasks()

    def grab(self):
        self.top.transient(self.parent)
        self.top.grab_set()

    def release_grab(self):
        self.top.grab_release()

    def is_loaded_image(self):
        return self.loaded_image_buffer is not None and self.loaded_image_buffer.getbuffer().nbytes > 0

    def forget_image_view(self):
        if self.reload_btn:
            self.reload_btn.grid_forget()
        if self.set_proxy_btn:
            self.set_proxy_btn.grid_forget()
        if self.image_label:
            self.image_label.grid_forget()

    def forget_arts_list(self):
        if self.arts_list:
            self.arts_list.grid_forget()
        if self.pick_btn:
            self.pick_btn.grid_forget()
        if self.back_btn:
            self.back_btn.grid_forget()

    def forget_art_view(self):
        if self.image_label:
            self.image_label.grid_forget()
        if self.save_new_art_btn:
            self.save_new_art_btn.grid_forget()
        if self.reload_btn:
            self.reload_btn.grid_forget()

    def build_new_art_view(self):
        self.forget_arts_list()
        self.picked_name = ""
        self.build_image(self.loaded_image_buffer)
        self.top.grid_rowconfigure(1, weight=1, pad=0, minsize=35)
        self.top.grid_columnconfigure(0, weight=20, pad=0)
        self.top.grid_columnconfigure(1, weight=1, pad=0)
        self.save_new_art_btn = ttk.Button(self.top, text=Strings.Current.REPLACE_OLD_ART_BUTTON_TITLE)
        self.save_new_art_btn.bind("<Button-1>", self._on_save_click)
        self.save_new_art_btn.grid(row=1, column=0, pady=(2, 7), padx=(5, 5), sticky="snew")
        self.reload_btn = ttk.Button(self.top, text=Strings.Current.RELOAD_BUTTON_TITLE)
        self.reload_btn.bind("<Button-1>", self._on_reload_click)
        self.reload_btn.grid(row=1, column=1, pady=(2, 7), padx=(5, 5), sticky="snew")

    def build_image(self, bytes_io=None):

        # noinspection PyBroadException
        try:
            if not bytes_io:
                img = Image.open(self.image_path)
            else:
                img = Image.open(bytes_io)
            ratio = img.height / img.width
            height = int(ratio * self.width)
            self.photo = ImageTk.PhotoImage(img.resize((self.width, height)))

            # noinspection PyTypeChecker
            self.image_label = tk.Label(self.top, image=self.photo)
        except:
            height = 100
            self.image_label = tk.Label(self.top, text=Strings.Current.NOT_FOUND)
        self.set_geometry(self.width, height)
        self.image_label.grid(row=0, pady=(0, 0), padx=(0, 0), columnspan=2, sticky="snew")

    def set_image_name_and_path(self, image_name, path):
        self.image_path = path
        self.image_name = image_name

    def build_image_view(self):
        self.picked_name = ""
        self.forget_art_view()
        self.build_image()
        self.top.grid_rowconfigure(1, weight=1, pad=0, minsize=35)
        self.top.grid_columnconfigure(0, weight=20, pad=0)
        self.top.grid_columnconfigure(1, weight=1, pad=0)
        self.reload_btn = ttk.Button(self.top, text=Strings.Current.RELOAD_BUTTON_TITLE)
        self.reload_btn.bind("<Button-1>", self._on_reload_click)
        self.reload_btn.grid(row=1, column=0, pady=(2, 7), padx=(5, 2), sticky="snew")
        self.set_proxy_btn = ttk.Button(self.top, text=Strings.Current.SET_PROXY_BUTTON_TITLE)
        self.set_proxy_btn.bind("<Button-1>", self._on_set_proxy_click)
        self.set_proxy_btn.grid(row=1, column=1, pady=(2, 7), padx=(2, 5), sticky="snew")

    # noinspection PyUnusedLocal
    def _on_save_click(self, event):
        if self.is_loaded_image():
            if self.image_name is None or self.image_name == "":
                image_name = GlobalUI.image_folder_name + os.sep + Path(self.file_name).stem + GlobalUI.image_extension
                path = self.image_path + image_name

            else:
                path = self.image_path
                image_name = self.image_name
            self.__on_save_art_click_listener(self.table_item, self.num, path, image_name, self.loaded_image_buffer.getvalue())

    # noinspection PyUnusedLocal
    def _on_set_proxy_click(self, event):
        ProxyPopup(self.parent, after_destroy=self.grab)

    def set_geometry(self, width, height):
        x = self.parent.winfo_x() + (self.parent.winfo_width() // 2) - width // 2
        y = self.parent.winfo_y() + (self.parent.winfo_height() // 2) - height // 2
        self.top.geometry(f"{width}x{height + self.button_area_height}+{x}+{y}")

    def build_arts_list(self):
        arts = GlobalUI.get_art_boxes(self.platform)
        if not arts or arts.__len__() == 0:
            return False
        similar_arts = SimilarNames.sort_by_similarity(self.ui_name, arts, 5)
        similar_arts_f = []
        f_name = Path(self.file_name).stem
        if self.ui_name != f_name:
            similar_arts_f = SimilarNames.sort_by_similarity(f_name, arts, 5)
        self.forget_image_view()
        self.forget_art_view()
        self.set_geometry(800, 600)
        columns = [ImagePreview.index, ImagePreview.game_name]
        #style = ttk.Style()
        #style.configure('ArtBox.Treeview.Heading',
        #                font=('Consolas', 10, 'bold'))
        self.arts_list = ttk.Treeview(self.top, columns=columns, show="headings", style='ArtBox.Treeview')
        scrollbar = ttk.Scrollbar(self.arts_list, orient="vertical", command=self.arts_list.yview)
        self.arts_list.configure(yscrollcommand=scrollbar.set)
        self.arts_list.heading(ImagePreview.game_name, text=PlatformsMeta.art_map[self.platform], anchor="center")
        self.arts_list.column(ImagePreview.game_name, width=520, stretch=True, anchor="w")
        self.arts_list.heading(ImagePreview.index, text=Strings.Current.GAME_COLUMN_NUM_TITLE, anchor="center")
        self.arts_list.column(ImagePreview.index, stretch=False, width=50, anchor="w")
        self.arts_list.bind("<Button-1>", self._on_row_click)

        icon = Strings.Current.UNFAV_STAR_ICON + " UI"
        for item in similar_arts:
            self.arts_list.insert("", "end", values=[icon, item])

        icon = Strings.Current.UNFAV_STAR_ICON + " Fi"
        for item in similar_arts_f:
            self.arts_list.insert("", "end", values=[icon, item])

        num = 1
        for item in arts:
            self.arts_list.insert("", "end", values=[str(num), item])
            num += 1
        self.arts_list.grid(row=0, pady=(4, 4), padx=(22, 8), columnspan=2, sticky="wesn")
        scrollbar.pack(side="right", fill="y")
        self.top.grid_rowconfigure(1, weight=1, pad=0, minsize=20)
        self.top.grid_columnconfigure(0, weight=1, pad=0)
        self.top.grid_columnconfigure(1, weight=1, pad=0)
        self.pick_btn = ttk.Button(self.top, text=Strings.Current.PICK_ART_BUTTON_TITLE)
        self.pick_btn.grid(row=1, column=0, pady=(0, 2), padx=(22, 10), sticky="ew")
        self.pick_btn['state'] = 'disabled'
        self.pick_btn.bind("<Button-1>", self._on_picked_name_click)
        self.back_btn = ttk.Button(self.top, text=Strings.Current.BACK_ART_BUTTON_TITLE)
        self.back_btn.grid(row=1, column=1, pady=(0, 2), padx=(10, 22), sticky="ew")
        self.back_btn.bind("<Button-1>", self._on_back_click)
        return True

    def _on_row_click(self, event):
        region = self.arts_list.identify_region(event.x, event.y)
        if region != "cell":
            return
        item = self.arts_list.identify_row(event.y)
        self.picked_name = self.arts_list.set(item, ImagePreview.game_name)
        self.pick_btn['state'] = 'normal'

    # noinspection PyUnusedLocal
    def _on_picked_name_click(self, event):
        if self.picked_name == "":
            return
        self.__on_picked_image_listener(self.platform, self.picked_name)

    # noinspection PyUnusedLocal
    def _on_back_click(self, event):
        self.forget_arts_list()
        self.build_image_view()

    # noinspection PyUnusedLocal
    def _on_reload_click(self, event):
        self.__on_reload_click_listener(self.platform)

    def _close_on_outside_click(self, event):
        x = event.x
        y = event.y
        if x < 0 or y < 0 or x > self.top.winfo_width() or y > self.top.winfo_height():
            self.top.destroy()
            GlobalUI.image_preview = None