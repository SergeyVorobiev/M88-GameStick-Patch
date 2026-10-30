from tkinter import ttk
import tkinter as tk


class ScrollableFrame(ttk.Frame):

    def __init__(self, container, *args, **kwargs):
        super().__init__(container, *args, **kwargs)
        self.main_frame = ttk.Frame(self, borderwidth=1, relief="solid")
        self.main_frame.pack(expand=True, fill="both", padx=20, pady=10)
        self.__create_canvas()

    def __create_canvas(self):
        self.canvas = tk.Canvas(self.main_frame, borderwidth=0, highlightthickness=0)
        self.scrollbar = ttk.Scrollbar(self.main_frame, orient="vertical", command=self.canvas.yview)

        self.scrollable_frame = ttk.Frame(self.canvas)

        self.scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all"))
        )

        self.canvas_window = self.canvas.create_window((0, 0), window=self.scrollable_frame, anchor="nw")

        self.canvas.configure(yscrollcommand=self.scrollbar.set)

        self.canvas.pack(side="left", fill="both", expand=True)
        self.scrollbar.pack(side="right", fill="y")

        self.canvas.bind_all("<MouseWheel>", lambda e: self.canvas.yview_scroll(int(-1 * (e.delta / 120)), "units"))
        self.canvas.bind_all("<Button-4>", lambda e: self.canvas.yview_scroll(-1, "units"))
        self.canvas.bind_all("<Button-5>", lambda e: self.canvas.yview_scroll(1, "units"))

        self.scrollable_frame.bind("<Configure>", self._on_frame_configure)
        self.canvas.bind("<Configure>", self._on_canvas_configure)

    def clear(self):
        for widget in self.scrollable_frame.winfo_children():
            widget.destroy()
        self.canvas.delete(self.canvas_window)
        self.canvas.destroy()
        self.scrollbar.destroy()
        self.scrollable_frame.destroy()
        self.__create_canvas()

    # noinspection PyUnusedLocal
    def _on_frame_configure(self, event=None):
        self._update_scroll_region()

    def _on_canvas_configure(self, event=None):
        self.canvas.itemconfig(self.canvas_window, width=event.width)
        self._update_scroll_region()

    def _update_scroll_region(self):
        bbox = self.canvas.bbox("all")
        if bbox:
            canvas_height = self.canvas.winfo_height()
            content_height = bbox[3] - bbox[1]
            if content_height < canvas_height:
                self.canvas.configure(scrollregion=(0, 0, bbox[2], canvas_height))
            else:
                self.canvas.configure(scrollregion=bbox)
