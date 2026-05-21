import tkinter as tk
from PIL import Image, ImageTk

from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Strings import Strings


class ImagePreview:
    def __init__(self, parent, image_path, image_name):
        self.top = tk.Toplevel(parent)
        self.top.iconbitmap(GlobalUI.icon)
        #self.top.attributes("-alpha", 0.0)
        self.top.withdraw()
        width = 500

        # noinspection PyBroadException
        try:
            img = Image.open(image_path)
            ratio = img.height / img.width
            height = int(ratio * width)
            self.photo = ImageTk.PhotoImage(img.resize((width, height)))

            # noinspection PyTypeChecker
            self.label = tk.Label(self.top, image=self.photo)
        except:
            height = width
            self.label = tk.Label(self.top, text=Strings.Current.NOT_FOUND)

        x = parent.winfo_x() + (parent.winfo_width() // 2) - width // 2
        y = parent.winfo_y() + (parent.winfo_height() // 2) - height // 2
        self.top.title(image_name)
        self.top.transient(parent)
        self.top.geometry(f"{width}x{height}+{x}+{y}")
        self.top.resizable(False, False)
        self.label.pack(fill="both", expand=True)

        self.top.bind("<Button-1>", self._close_on_outside_click, add=True)
        self.top.bind("<Button-3>", self._close_on_outside_click, add=True)
        self.top.bind("<Escape>", lambda e: self.top.destroy(), add=True)
        self.top.grab_set()
        self.top.focus_force()
        #self.top.attributes("-alpha", 1.0)
        self.top.deiconify()
        self.top.update_idletasks()

    def _close_on_outside_click(self, event):
        x = event.x
        y = event.y
        if x < 0 or y < 0 or x > self.top.winfo_width() or y > self.top.winfo_height():
            self.top.destroy()