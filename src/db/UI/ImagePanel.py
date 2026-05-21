from tkinter import ttk
from PIL import Image, ImageTk

from src.db.UI.GlobalUI import GlobalUI


class ImagePanel:

    def __init__(self, root, parent):
        self.root = root
        self.parent = parent
        self.photo = None # adapted
        self.img = None # default size
        self.height = 0
        self.width = 0
        self.percent = 0.8
        self.max_height = 170
        self.width_ratio = 0
        self.height_ratio = 0
        self.label = ttk.Label(parent, padding=0, anchor='center', compound='image', relief='flat', borderwidth=0, border=0)
        self.def_path = GlobalUI.m88_image
        self.current_path = ""
        self.load_picture(self.def_path)
        self.label.pack_configure(fill="both", anchor="center", expand=True, padx=0, pady=0, ipadx=0, ipady=0)
        self.parent.bind("<Configure>", self.on_resize)

    def load_picture(self, path):
        if path is None or path == "":
            path = self.def_path
        if path != self.current_path:
            self.current_path = path

            # noinspection PyBroadException
            try:
                self.img = Image.open(self.current_path)
            except:
                self.current_path = self.def_path
                self.img = Image.open(self.current_path)
            self.height_ratio = self.img.width / self.img.height
            self.width_ratio = self.img.height / self.img.width
            return True
        else:
            return False

    def on_picture_changed(self, path):
        if not self.load_picture(path):
            return
        self.set_picture()

    def set_picture(self):
        if self.height == 0 or self.img is None:
            return
        height = int(self.percent * self.height)
        width = int(self.height_ratio * height)
        if width > int(self.percent * self.width):
            width = int(self.percent * self.width)
            height  = int(self.width_ratio * width)
        self.photo = ImageTk.PhotoImage(self.img.resize((width, height)))

        # noinspection PyTypeChecker
        self.label.config(image=self.photo)

    # noinspection PyUnusedLocal
    def on_resize(self, event):
        container_width = self.parent.winfo_width()
        container_height = self.parent.winfo_height()
        self.height = container_height
        self.width = container_width
        self.set_picture()
        self.parent.pack_propagate(False)

    def set_default_picture(self):
        self.on_picture_changed(self.def_path)








