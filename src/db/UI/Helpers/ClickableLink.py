from tkinter import ttk
import webbrowser


class ClickableLink(ttk.Label):
    def __init__(self, parent, text, url, **kwargs):
        super().__init__(parent, text=text, **kwargs)

        self.url = url
        self.config(
            foreground="#0066cc",
            cursor="hand2",
            font=("Consolas", 10)
        )

        self.bind("<Button-1>", self.open_link)
        self.bind("<Enter>", self.on_enter)
        self.bind("<Leave>", self.on_leave)

    # noinspection PyUnusedLocal
    def open_link(self, event):
        webbrowser.open(self.url)

    # noinspection PyUnusedLocal
    def on_enter(self, event):
        self.config(foreground="#0099ff")

    # noinspection PyUnusedLocal
    def on_leave(self, event):
        self.config(foreground="#0066cc")