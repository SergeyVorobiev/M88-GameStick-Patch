from tkinter import ttk
import tkinter as tk

from src.db.UI.Strings import Strings


class MainLayout:

    def __init__(self, root):
        self.root = root

    @staticmethod
    def get_window(title, icon, width, height):
        root = tk.Tk()
        root.title(title)
        root.iconbitmap(icon)
        root.update_idletasks()
        screen_width = root.winfo_screenwidth()
        screen_height = root.winfo_screenheight()
        x = (screen_width - width) // 2
        y = (screen_height - height) // 2 - 50
        root.geometry(f"{width}x{height}+{x}+{y}")
        return root

    def get_frames(self):
        main_frame = ttk.Frame(self.root)
        main_frame.pack(fill="both", expand=True, padx=0, pady=0)
        main_frame.grid_columnconfigure(0, weight=1, minsize=50, pad=0)
        main_frame.grid_columnconfigure(1, weight=10, pad=0)
        main_frame.grid_rowconfigure(0, weight=1, minsize=105, pad=0)
        main_frame.grid_rowconfigure(1, weight=17, pad=0)
        main_frame.grid_rowconfigure(2, weight=1, minsize=20, pad=0)

        # Setup top_frame 1x2
        top_frame = ttk.Frame(main_frame, padding=0, relief="flat")
        top_frame.grid(row=0, column=0, columnspan=2, sticky="nsew", pady=0, padx=(0, 1))

        top_frame.grid_columnconfigure(0, weight=3)
        top_frame.grid_columnconfigure(1, weight=2)
        top_frame.grid_rowconfigure(0, weight=1, minsize=90, pad=0)

        top_lines = ttk.LabelFrame(top_frame, text=Strings.Current.CONTROL_ICON, padding=0, relief="flat")
        top_lines.grid(row=0, column=0, sticky="nsew", pady=0, padx=(5, 0))

        top_lines.grid_rowconfigure(0, weight=10)
        top_lines.grid_rowconfigure(1, weight=1)
        top_lines.grid_columnconfigure(0, weight=1)

        path_frame = ttk.Frame(top_lines, padding=0, relief="flat")
        path_frame.grid(row=0, column=0, padx=5, sticky="new", pady=(2, 2))

        btn_frame = ttk.Frame(top_lines, padding=0, relief="flat")
        btn_frame.grid(row=1, column=0, pady=(2, 2), sticky="nswe")

        image_frame = ttk.LabelFrame(top_frame, text=Strings.Current.IMAGE_ICON, padding=0, relief="flat")
        image_frame.grid(row=0, column=1, padx=5, rowspan=2, pady=0, sticky="nsew", ipadx=0, ipady=0)

        left_frame = tk.LabelFrame(main_frame, text=Strings.Current.PLATFORMS_ICON)
        left_frame.grid(row=1, column=0, sticky="nsew", padx=(5, 2), pady=0)

        right_frame = tk.LabelFrame(main_frame, text=Strings.Current.GAMES_ICON)
        right_frame.grid(row=1, column=1, sticky="nsew", padx=(2, 5), pady=0)

        foot_frame = tk.Frame(main_frame)
        foot_frame.grid(row=2, column=0, columnspan=2, padx=5, pady=0, sticky="w")

        return path_frame, btn_frame, image_frame, left_frame, right_frame, foot_frame