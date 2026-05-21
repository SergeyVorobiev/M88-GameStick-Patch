from tkinter import ttk

from src.db.UI.Helpers.DoubleClick import DoubleClick
from src.db.UI.Strings import Strings


class GamesTable:
    
    in_db = "in_db"
    ui_num = "ui_num"
    db_num = "db_num"
    f_name = "f_name"
    ui_name = "ui_name"
    i_name = "i_name"
    platform = "platform"
    fav = "fav"
    his = "his"

    def __init__(self, root, parent):
        self.__root = root
        self.__parent = parent

        columns = (GamesTable.in_db, GamesTable.ui_num, GamesTable.f_name, GamesTable.ui_name, GamesTable.i_name, GamesTable.platform, GamesTable.his, GamesTable.fav, GamesTable.db_num, "")
        tree = ttk.Treeview(parent, columns=columns, show="headings", height=20)

        tree.heading(GamesTable.ui_num, text=Strings.Current.GAME_COLUMN_NUM_TITLE, anchor="center")
        tree.heading(GamesTable.f_name, text=Strings.Current.GAME_COLUMN_FILE_NAME_TITLE, anchor="w")
        tree.heading(GamesTable.ui_name, text=Strings.Current.GAME_COLUMN_UI_NAME_TITLE, anchor="w")
        tree.heading(GamesTable.i_name, text=Strings.Current.GAME_COLUMN_IMAGE_PATH_TITLE, anchor="w")
        tree.heading(GamesTable.db_num, text=Strings.Current.GAME_COLUMN_DB_NUM_TITLE, anchor="center")
        tree.heading(GamesTable.platform, text=Strings.Current.GAME_COLUMN_PLATFORM_TITLE, anchor="center")
        tree.heading(GamesTable.in_db, text=Strings.Current.GAME_COLUMN_IN_DB_TITLE, anchor="center")
        tree.heading(GamesTable.fav, text=Strings.Current.GAME_COLUMN_FAVORITES_TITLE, anchor="center")
        tree.heading(GamesTable.his, text=Strings.Current.GAME_COLUMN_HISTORY_TITLE, anchor="center")
        tree.heading("", text="", anchor="center")

        tree.column(GamesTable.platform, width=100, anchor="center")
        tree.column(GamesTable.f_name, width=295, anchor="w")
        tree.column(GamesTable.i_name, width=295, anchor="w")
        tree.column(GamesTable.ui_name, width=295, anchor="w")
        tree.column(GamesTable.ui_num, width=50, anchor="center")
        tree.column(GamesTable.db_num, width=50, anchor="center")
        tree.column(GamesTable.in_db, width=50, anchor="center")
        tree.column(GamesTable.fav, width=40, anchor="center")
        tree.column(GamesTable.his, width=50, anchor="center")
        tree.column("", width=5, anchor="center")
        scrollbar = ttk.Scrollbar(tree, orient="vertical", command=tree.yview)
        tree.configure(yscrollcommand=scrollbar.set)

        for col in tree["columns"]:
            tree.heading(col, command=lambda c=col: self.sort_by_column(c))
        self.__sort_reverse = True
        self.__sort_column = None
        self.__col_index = -1
        self.__tree = tree
        self.__on_check_listener = lambda x, y: 0
        self.__on_image_click_listener = lambda x, y: 0
        self.__on_fav_click_listener = lambda x, y: 0
        self.__on_file_name_click_listener = lambda u, w, x, y, z: 0
        self.__on_ui_name_click_listener = lambda u, w, x, y, z: 0
        self.__on_row_click_listener = lambda x, y: 0
        self.__on_load_data_listener = lambda: 0
        self.__bind_actions()

        # workaround for double click because the native one is bs
        self.__double_click = DoubleClick()
        tree.pack(fill="both", expand=True, padx=6, pady=6)
        scrollbar.pack(side="right", fill="y")

    def load_data(self, games_list, reset_sort=False):
        if reset_sort:
            self.__sort_reverse = True
            self.__sort_column = None
            self.__col_index = -1
            self.update_column_headings(-1)
        self.__on_load_data_listener()
        for game in games_list:
            if game[0]:
                game[0] = Strings.Current.CHECK_ICON
            else:
                game[0] = Strings.Current.UNCHECK_ICON
            if game[7] == 0:
                game[7] = Strings.Current.UNFAV_ICON
            else:
                game[7] = Strings.Current.FAV_ICON
        if self.__col_index > -1:
            if self.__col_index == 6:
                games_list.sort(key=lambda x: int(x[self.__col_index]), reverse=self.__sort_reverse)
            else:
                games_list.sort(key=lambda x: str(x[self.__col_index]), reverse=self.__sort_reverse)
        self.__tree.delete(*self.__tree.get_children())
        k = 0
        for game in games_list:
            self.__tree.insert("", k, values=game)
            k += 1

    def get_view(self):
        return self.__tree

    def sort_by_column(self, col):
        data = []
        for item in self.__tree.get_children(''):
            values = self.__tree.item(item, "values")
            data.append((values, item))

        self.__col_index = self.__tree["columns"].index(col)

        if self.__sort_column == col:
            self.__sort_reverse = not self.__sort_reverse
        self.__sort_column = col
        if self.__col_index == 6:
            data.sort(key=lambda x: int(x[0][self.__col_index]), reverse=self.__sort_reverse)
        else:
            data.sort(key=lambda x: str(x[0][self.__col_index]), reverse=self.__sort_reverse)
        for index, (_, item) in enumerate(data):
            self.__tree.move(item, '', index)

        self.update_column_headings(col)

    def update_column_headings(self, sorted_col):
        up = Strings.Current.UP_ARROW_ICON
        down = Strings.Current.DOWN_ARROW_ICON
        for col in self.__tree["columns"]:
            text = self.__tree.heading(col, "text").replace(up, "").replace(down, "")

            if col == sorted_col:
                arrow = up if self.__sort_reverse else down
                self.__tree.heading(col, text=text + arrow)
            else:
                self.__tree.heading(col, text=text)

    def set_on_ui_name_click_listener(self, on_ui_name_click_listener):
        self.__on_ui_name_click_listener = on_ui_name_click_listener

    def set_on_file_name_click_listener(self, on_file_name_click_listener):
        self.__on_file_name_click_listener = on_file_name_click_listener

    def set_on_load_data_listener(self, on_load_data_listener):
        self.__on_load_data_listener = on_load_data_listener

    def set_on_check_listener(self, on_check_listener):
        self.__on_check_listener = on_check_listener

    def set_on_row_click_listener(self, on_row_click_listener):
        self.__on_row_click_listener = on_row_click_listener

    def set_on_image_click_listener(self, on_image_click_listener):
        self.__on_image_click_listener = on_image_click_listener

    def set_on_fav_click_listener(self, on_fav_click_listener):
        self.__on_fav_click_listener = on_fav_click_listener

    def set_names(self, item, file_name, ui_name, image_path):
        self.__tree.set(item, GamesTable.f_name, file_name)
        self.__tree.set(item, GamesTable.ui_name, ui_name)
        self.__tree.set(item, GamesTable.i_name, image_path)

    def __bind_actions(self):
        def on_multi_right_click(event):
            region = self.__tree.identify_region(event.x, event.y)
            if region != "cell":
                return
            column = self.__tree.identify_column(event.x)
            if column == "#5":
                item = self.__tree.identify_row(event.y)
                if item:
                    platform = self.__tree.set(item, GamesTable.platform)
                    i_name = self.__tree.set(item, GamesTable.i_name)
                    self.__on_image_click_listener(platform, i_name)
            elif column == "#3":
                item = self.__tree.identify_row(event.y)
                if item:
                    file_name = self.__tree.set(item, GamesTable.f_name)
                    platform = self.__tree.set(item, GamesTable.platform)
                    ui_name = self.__tree.set(item, GamesTable.ui_name)
                    image_path = self.__tree.set(item, GamesTable.i_name)
                    self.__on_file_name_click_listener(item, platform, file_name, ui_name, image_path)
            elif column == "#4":
                item = self.__tree.identify_row(event.y)
                if item:
                    file_name = self.__tree.set(item, GamesTable.f_name)
                    platform = self.__tree.set(item, GamesTable.platform)
                    ui_name = self.__tree.set(item, GamesTable.ui_name)
                    image_path = self.__tree.set(item, GamesTable.i_name)
                    self.__on_ui_name_click_listener(item, platform, file_name, ui_name, image_path)

        def on_multi_click(event):
            ch = Strings.Current.CHECK_ICON
            unch = Strings.Current.UNCHECK_ICON
            fav = Strings.Current.FAV_ICON
            unfav = Strings.Current.UNFAV_ICON
            region = self.__tree.identify_region(event.x, event.y)
            if region != "cell":
                self.__double_click.reset()
                return
            item = self.__tree.identify_row(event.y)
            column = self.__tree.identify_column(event.x)
            i_name = self.__tree.set(item, GamesTable.i_name)
            platform = self.__tree.set(item, GamesTable.platform)
            self.__on_row_click_listener(i_name, platform)
            is_double_click = self.__double_click.is_double_click(item)
            if column == "#1" or column == "#8":
                self.__double_click.reset() # Prevent double click as we will handle single click
            if column == "#1" or (is_double_click and not column == "#5" and not column == "#8"):
                if item:
                    current = self.__tree.set(item, GamesTable.in_db)
                    current_id = self.__tree.set(item, GamesTable.ui_num)
                    new = unch if current == ch else ch
                    if new == unch:
                        new_check = False
                    else:
                        new_check = True
                    self.__on_check_listener(new_check, current_id)
                    self.__tree.set(item, GamesTable.in_db, new)
            if column == "#5" and is_double_click:
                if item:
                    platform = self.__tree.set(item, GamesTable.platform)
                    i_name = self.__tree.set(item, GamesTable.i_name)
                    self.__on_image_click_listener(platform, i_name)
            elif column == "#8":
                if item:
                    ui_num = self.__tree.set(item, GamesTable.ui_num)
                    current = self.__tree.set(item, GamesTable.fav)
                    new = unfav if current == fav else fav
                    self.__tree.set(item, GamesTable.fav, new)
                    if new == unfav:
                        value = 0
                    else:
                        value = 1
                    self.__on_fav_click_listener(ui_num, value)

        self.__tree.bind("<Button-1>", on_multi_click)
        self.__tree.bind("<Button-3>", on_multi_right_click)

