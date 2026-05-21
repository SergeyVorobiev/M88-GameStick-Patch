from tkinter import ttk

from src.db.UI.Strings import Strings


class PlatformsList:

    platform = "platform"

    num = "num"

    total = "total"

    def __init__(self, root, parent):
        self.__root = root
        self.__parent = parent
        columns = [PlatformsList.platform, PlatformsList.num, PlatformsList.total]
        tree = ttk.Treeview(parent, columns=columns, show="headings")
        tree.pack(fill="both", expand=True, padx=6, pady=6)
        tree.heading(PlatformsList.platform, text=Strings.Current.LIST_PLATFORM_TITLE, anchor="w")
        tree.heading(PlatformsList.num, text=Strings.Current.LIST_ENABLED_TITLE, anchor="e")
        tree.heading(PlatformsList.total, text=Strings.Current.LIST_TOTAL_TITLE, anchor="e")
        tree.column(PlatformsList.platform, width=90, anchor="w")
        tree.column(PlatformsList.num, width=20, anchor="e")
        tree.column(PlatformsList.total, width=20, anchor="e")

        self.__tree = tree
        self.__bind_actions()
        self.__selected_platform = lambda platform : 0

    def __bind_actions(self):

        # noinspection PyUnusedLocal
        def on_click(event):
            selected = self.__tree.selection()
            if selected:
                values = self.__tree.item(selected[0], "values")
                self.__selected_platform(values[0])
        self.__tree.bind("<<TreeviewSelect>>", on_click)

    def get_view(self):
        return self.__tree

    def set_select_listener(self, selected_platform):
        self.__selected_platform = selected_platform

    def load_data(self, platforms_list):
        self.__tree.delete(*self.__tree.get_children())
        k = 0
        for platform in platforms_list:
            self.__tree.insert("", k, values=platform)
            k += 1



