import tkinter as tk


class EntryHint(tk.Entry):
    def __init__(self, parent, text="", hint_text="", **kwargs):
        super().__init__(parent, **kwargs)

        self.hint_text = hint_text + "\t"
        self.hint_color = "gray"
        self.normal_color = "black"
        if text is None or text == "":
            self.insert(0, self.hint_text)
            self.config(foreground=self.hint_color)
        else:
            self.insert(0, text)
            self.config(foreground=self.normal_color)
        self.bind("<FocusIn>", self.on_focus_in)
        self.bind("<FocusOut>", self.on_focus_out)

    # noinspection PyUnusedLocal
    def on_focus_in(self, event):

        # Dangerous, but for current purposes it's ok
        if self.get() == self.hint_text:
            self.delete(0, tk.END)
            self.config(foreground=self.normal_color)

    # noinspection PyUnusedLocal
    def on_focus_out(self, event):
        if not self.get():
            self.insert(0, self.hint_text)
            self.config(foreground=self.hint_color)