import os
import threading
import time
from pathlib import Path
from tkinter import filedialog

from src.OtherTool import OtherTool
from src.db import PlatformsMeta
from src.db.DBExtractor import DBExtractor
from src.db.GamesDBBuilder import GamesDBBuilder
from src.db.GamesExplorer import GamesExplorer
from src.db.PlatformsMeta import get_all_extensions
from src.db.UI.ConfirmDialog import ConfirmDialog
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.LibRetroArts import LibRetroArts
from src.db.UI.ImagePreview import ImagePreview
from src.db.UI.LoadingWindow import LoadingWindow
from src.db.UI.Popup import Popup
from src.db.UI.Strings import Strings


class Handlers:

    @staticmethod
    def get_platforms_list():
        result = [[GlobalUI.all, 0, 0]]
        total = 0
        indb_total = 0
        for key, games in GlobalUI.games_rows.items():
            size = len(games)
            indb = 0
            for game in games:
                indb += int(GlobalUI.selected_rows[game[1]][0])
            result.append([key, indb, size])
            total += size
            indb_total += indb
        result[0][1] = indb_total
        result[0][2] = total
        if total == 0:
            result = []
        return result

    @staticmethod
    def sd_path_selected(path):
        GlobalUI.reset()
        GlobalUI.folder_path = path
        GlobalUI.roms_folder_path = path + os.sep + GlobalUI.game_folder_name

        def after_task(rows):
            GlobalUI.games_table.load_data(rows, reset_sort=True)
            GlobalUI.platforms_list.load_data(Handlers.get_platforms_list())
            games_num = GlobalUI.get_games_num()
            if games_num == 0:
                GlobalUI.control_panel.disable_buttons()
            else:
                GlobalUI.control_panel.enable_buttons()
        def task():
            rows = []
            loading = None
            try:
                loading = LoadingWindow(GlobalUI.root, Strings.Current.LOADING_TITLE)
                GlobalUI.games_dict = GamesExplorer.find_all_games(path + os.sep + GlobalUI.game_folder_name, lambda str1: loading.set_text(
                    f"{Strings.Current.SCANNING_GAMES_TEXT} {str1}"))
                GlobalUI.db_data = DBExtractor.get_data(path + os.sep + GlobalUI.db_name)
                Handlers.extract_rows(loading)
                rows = Handlers.get_game_rows_for_platform()
            finally:
                GlobalUI.root.after(0, lambda: after_task(rows))
                if loading:
                    GlobalUI.root.after(0, loading.destroy)

        threading.Thread(target=task, daemon=True).start()

    @staticmethod
    def extract_rows(loading):
        GlobalUI.games_rows = {}
        GlobalUI.selected_rows = {}
        idx = 1

        # Initialize a dictionary with ui game names to get ability to sort by ui names
        to_sort_dict = {}
        for key, games in GlobalUI.games_dict.items():
            rows = []
            to_sort_dict[key] = rows
            for game in games:
                row = []
                rows.append(row)
                row.append(game)

                # noinspection PyBroadException
                try:
                    game_name = GlobalUI.db_data[key][game.name][1]
                except:
                    game_name = game.stem
                row.append(game_name)

        for key, games in to_sort_dict.items():
            sorted_games = sorted(games, key=lambda r: r[1].lower())
            current_games = []
            GlobalUI.games_rows[key] = current_games
            loading.set_text(f"{Strings.Current.SCANNING_IMAGES_TEXT} {key}")
            for row in sorted_games:
                path_data = row[0]
                path = path_data.name
                gnum = f"{idx:0{5}d}"
                db_num = ""
                game_name = row[1]
                db_image_path = ""
                in_db = True
                his = 0
                fav = 0

                # noinspection PyBroadException
                try:
                    result = GlobalUI.db_data[key][path]
                    db_image_path = result[0]
                    db_num = result[4]
                    fav = result[2]
                    if fav > 1:
                        fav = 1
                    his = result[3]
                except:
                    in_db = False
                GlobalUI.selected_rows[gnum] = [in_db, fav, his]
                root_path = str(path_data.parent) + os.sep
                if db_image_path != "":
                    db_image_path = root_path + db_image_path

                image_path = root_path + GlobalUI.image_folder_name + os.sep + path_data.stem + GlobalUI.image_extension
                media_path = root_path + GlobalUI.image_media_folder_name + os.sep + path_data.stem + os.sep + GlobalUI.standard_image_name
                image_path = Handlers.check_image_path(root_path, db_image_path, image_path, media_path)
                image_path = image_path.replace("\\", "/")
                current_games.append([in_db, gnum, path, game_name, image_path, key, 0, 0, db_num])
                idx += 1

    @staticmethod
    def check_image_path(root_path, db_image_path, image_path, media_path):
        if db_image_path != "" and Path(db_image_path).is_file():
            return db_image_path[len(root_path):]
        if image_path != "" and Path(image_path).is_file():
            return image_path[len(root_path):]
        if image_path != "" and Path(media_path).is_file():
            return media_path[len(root_path):]
        return ""

    @staticmethod
    def selected_platform(platform):
        if platform == GlobalUI.current_platform:
            return
        GlobalUI.current_platform = platform
        GlobalUI.games_table.load_data(Handlers.get_game_rows_for_platform())

    @staticmethod
    def get_game_rows_for_platform():
        platform = GlobalUI.current_platform
        result = []
        if platform == GlobalUI.all:
            for key, rows in GlobalUI.games_rows.items():
                for row in rows:
                    num = row[1]
                    selected_row = GlobalUI.selected_rows[num]
                    row[0] = selected_row[0]
                    row[6] = selected_row[2]
                    row[7] = selected_row[1]
                    result.append(row)
        else:
            for row in GlobalUI.games_rows[platform]:
                num = row[1]
                selected_row = GlobalUI.selected_rows[num]
                row[0] = selected_row[0]
                row[6] = selected_row[2]
                row[7] = selected_row[1]
                result.append(row)
        return result

    @staticmethod
    def on_row_check(new_check, ui_num):
        GlobalUI.selected_rows[ui_num][0] = new_check
        GlobalUI.platforms_list.load_data(Handlers.get_platforms_list())

    @staticmethod
    def on_generate_db_click():
        if GlobalUI.folder_path == "":
            return

        def proceed_function():
            def task():
                loading = None
                try:
                    loading = LoadingWindow(GlobalUI.root, Strings.Current.SAVING_TITLE)
                    loading.set_text(GlobalUI.new_db_name)
                    db_data = Handlers.build_result_db_data()
                    GamesDBBuilder.create_db_and_fill2(db_data, GlobalUI.folder_path + os.sep + GlobalUI.new_db_name,
                                                       lambda p: loading.set_text(f"{GlobalUI.new_db_name} {p}"))
                finally:
                    if loading:
                        GlobalUI.root.after(0, loading.destroy)

            OtherTool.del_file(GlobalUI.folder_path + os.sep + GlobalUI.new_db_name)
            time.sleep(0.2)
            threading.Thread(target=task, daemon=True).start()
        message = Strings.Current.GENERATE_DB_MESSAGE.replace('{%s1}', GlobalUI.folder_path).replace('{%s2}', GlobalUI.new_db_name)
        ConfirmDialog(GlobalUI.root, message, proceed_function)

    @staticmethod
    def build_result_db_data():
        result = {}
        for key, value in GlobalUI.games_rows.items():
            items = []
            result[key] = items
            platform_path = GlobalUI.roms_folder_path + os.sep + key + os.sep
            for arr in value:
                selected_row = GlobalUI.selected_rows[arr[1]]
                if Path(platform_path + arr[2]).is_file() and selected_row[0]:
                    item = {'file_name': arr[2], 'ui_name': arr[3], 'image_path': arr[4], 'fav': selected_row[1], 'his': selected_row[2]}
                    items.append(item)
        return result

    @staticmethod
    def assign_value(index, value):
        platform = GlobalUI.current_platform
        result = []
        if platform == GlobalUI.all:
            for key, rows in GlobalUI.games_rows.items():
                for row in rows:
                    num = row[1]
                    selected_row = GlobalUI.selected_rows[num]
                    selected_row[index] = value
                    row[0] = selected_row[0]
                    row[6] = selected_row[2]
                    row[7] = selected_row[1]
                    result.append(row)

        else:
            for row in GlobalUI.games_rows[platform]:
                num = row[1]
                selected_row = GlobalUI.selected_rows[num]
                selected_row[index] = value
                row[0] = selected_row[0]
                row[6] = selected_row[2]
                row[7] = selected_row[1]
                result.append(row)
        GlobalUI.games_table.load_data(result)

    @staticmethod
    def on_select_all_click():
        if GlobalUI.get_games_num() == 0:
            return
        Handlers.assign_value(0, True)
        GlobalUI.platforms_list.load_data(Handlers.get_platforms_list())

    @staticmethod
    def on_deselect_all_click():
        if GlobalUI.get_games_num() == 0:
            return
        Handlers.assign_value(0, False)
        GlobalUI.platforms_list.load_data(Handlers.get_platforms_list())

    @staticmethod
    def on_clean_game_folders_click():
        if GlobalUI.get_games_num() == 0:
            return
        extensions = get_all_extensions()
        extensions.add(GlobalUI.config_extension)

        # All extensions now are used independently of the platform because user can redefine it
        if GlobalUI.current_platform == GlobalUI.all:
            width = 600
            height = 300
            platform_name = Strings.Current.ALL_PLATFORM_FOLDERS_STRING
        else:
            width = 600
            height = 300
            platform_name = Strings.Current.THE_PLATFORM_FOLDER_STRING.replace('{%s1}', GlobalUI.current_platform)
        part1 = Strings.Current.CLEAN_GAME_FOLDERS_TEXT_PART_1.replace('{%s1}', str(extensions)).replace('{%s2}', platform_name)
        part2 = Strings.Current.CLEAN_GAME_FOLDERS_TEXT_PART_2
        part3 = Strings.Current.CLEAN_GAME_FOLDERS_TEXT_PART_3
        message = part1 + part2 + part3
        ConfirmDialog(GlobalUI.root, message, Handlers.clean_files, width=width, height=height, top_pad_y=20,
                      close_before_callback=True)

    @staticmethod
    def on_clean_image_folders_click():
        if GlobalUI.get_games_num() == 0:
            return
        if GlobalUI.current_platform == GlobalUI.all:
            platform = Strings.Current.ALL_PLATFORM_FOLDERS_STRING
        else:
            platform = Strings.Current.THE_PLATFORM_FOLDER_STRING.replace('{%s1}', GlobalUI.current_platform)
        message = Strings.Current.CLEAN_IMAGE_FOLDERS_TEXT_1.replace('{%s1}', platform)
        message += Strings.Current.CLEAN_IMAGE_FOLDERS_TEXT_2
        ConfirmDialog(GlobalUI.root, message, Handlers.clean_images_dialog, height=240, top_pad_y=20, close_before_callback=True)

    @staticmethod
    def clean_images_background(result_folder, platform, value, callback):
        num = 0
        names = set()
        for row in value:
            names.add(Path(row[2]).stem)
            names.add(row[3])
        image_result_folder = str(result_folder.absolute()) + os.sep + platform + os.sep + GlobalUI.image_folder_name
        OtherTool.make_dirs(image_result_folder)

        # images
        folder_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + GlobalUI.image_folder_name)
        if folder_path.is_dir():
            for item in folder_path.iterdir():
                if item.is_file():
                    if item.stem not in names or item.stat().st_size == 0 or item.suffix != GlobalUI.image_extension:
                        num += 1
                        callback(platform, item.name, num)
                        result = OtherTool.move_file(item.absolute(), image_result_folder)
                        if not result:
                            OtherTool.del_file(item.absolute())


        image_result_folder = str(result_folder.absolute()) + os.sep + platform + os.sep + GlobalUI.image_media_folder_name
        OtherTool.make_dirs(image_result_folder)

        # media
        folder_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + GlobalUI.image_media_folder_name)
        if folder_path.is_dir():
            for item in folder_path.iterdir():
                if item.is_file():
                    num += 1
                    callback(platform, item.name, num)
                    result = OtherTool.move_file(item.absolute(), image_result_folder)
                    if not result:
                        OtherTool.del_file(item.absolute())
                elif item.is_dir() and item.stem not in names:
                    num += 1
                    callback(platform, item.name, num)
                    result = OtherTool.move_file(item.absolute(), image_result_folder)
                    if not result:
                        OtherTool.del_file(item.absolute())

    @staticmethod
    def clean_all_images_background(result_folder, callback):
        OtherTool.make_dirs(result_folder.absolute())
        if GlobalUI.current_platform == GlobalUI.all:
            for platform, value in GlobalUI.games_rows.items():
                Handlers.clean_images_background(result_folder, platform, value, callback)
        else:
            values = GlobalUI.games_rows[GlobalUI.current_platform]
            Handlers.clean_images_background(result_folder, GlobalUI.current_platform, values, callback)

    @staticmethod
    def clean_images_dialog():
        folder_path = filedialog.askdirectory(
            title=Strings.Current.WHERE_TO_MOVE_FILES_TITLE,
            initialdir="/"
        )
        if folder_path:
            folder_path = Path(folder_path + os.sep + GlobalUI.game_folder_name)
            root = Path(GlobalUI.roms_folder_path)
            if root == folder_path:
                print("Wrong, the folder must not be root")
                return
            else:
                print(folder_path)
            def task():
                loading = None
                try:
                    loading = LoadingWindow(GlobalUI.root, Strings.Current.CLEANING_TITLE)
                    def callback(platform, name, num):
                        print(platform, name, num)
                        loading.set_text(f"{platform}: {num}\n\n{name[:20]}")
                    Handlers.clean_all_images_background(folder_path, callback)
                finally:
                    if loading:
                        GlobalUI.root.after(0, loading.destroy)
            threading.Thread(target=task, daemon=True).start()

    @staticmethod
    def clean_files():
        folder_path = filedialog.askdirectory(
            title=Strings.Current.WHERE_TO_MOVE_FILES_TITLE,
            initialdir="/"
        )
        if folder_path:
            folder_path_2 = Path(folder_path + os.sep + GlobalUI.game_folder_name)
            root = Path(GlobalUI.roms_folder_path)
            if root == folder_path_2:
                print("Wrong, the folder must not be root")
                return
            def task():
                loading = None
                try:
                    loading = LoadingWindow(GlobalUI.root, Strings.Current.CLEANING_TITLE)
                    Handlers.clean_files_background(folder_path, lambda platform, name: loading.set_text(Strings.Current.CLEANING_WORD + f" '{platform}'\n\n{name[:20]}"))
                finally:
                    if loading:
                        GlobalUI.root.after(0, loading.destroy)

            threading.Thread(target=task, daemon=True).start()

    @staticmethod
    def clean_files_background(result_folder, callback):
        f = set()

        def clean(platform):
            platform_result_folder = result_folder + os.sep + GlobalUI.game_folder_name + os.sep + platform
            OtherTool.make_dirs(platform_result_folder)
            path = Path(GlobalUI.roms_folder_path + os.sep + platform)
            # extensions = set(PlatformsMeta.extensions_map[platform])
            extensions = get_all_extensions() # use all extensions because a user can redefine the platform
            extensions.add(GlobalUI.config_extension)
            if path.is_dir():
                for item in path.iterdir():
                    if item.is_file() and (item.name.endswith(".pure.zip") or not extensions.__contains__(item.suffix.lower())):
                        f.add(item.suffix)
                        result = OtherTool.move_file(item.absolute(), platform_result_folder)
                        if not result:
                            OtherTool.del_file(item.absolute())
                        print(platform, item.name, item.absolute())
                        callback(platform, item.name)

        if GlobalUI.current_platform == GlobalUI.all:
            for key, rows in GlobalUI.games_rows.items():
                clean(key)
        else:
            clean(GlobalUI.current_platform)
        print("\n\n", f)

    @staticmethod
    def on_image_click(item, num, platform, file_name, ui_name, image_path):
        GlobalUI.image_preview = ImagePreview(GlobalUI.root,
                                              item,
                                              num,
                                              GlobalUI.roms_folder_path + os.sep + platform + os.sep + image_path,
                                              image_path,
                                              file_name, ui_name, platform,
                                              on_reload_click_listener=Handlers.on_reload_image_click,
                                              on_picked_image_listener=Handlers.on_picked_image_click,
                                              on_save_art_listener=Handlers.on_save_art_click)

    @staticmethod
    def on_save_art_click(item, num, path, image_name, img_bytes):
        try:
            OtherTool.make_dirs(Path(path).parent)
            with open(path, 'wb') as f:
                f.write(img_bytes)
            GlobalUI.image_preview.set_image_name_and_path(image_name, path)
            GlobalUI.image_preview.build_image_view()
            GlobalUI.games_table.set_image_path(item, image_name.replace("\\", "/"))
            if num == GlobalUI.games_table.get_selected_num():
                GlobalUI.image_frame.on_picture_changed(path, True)
        except Exception as e:
            Popup(GlobalUI.root, str(e), width=300, height=150, top_pad_y=10, after_destroy_callback=GlobalUI.image_preview.grab)

    @staticmethod
    def on_reload_image_click(platform):
        arts = GlobalUI.get_art_boxes(platform)
        if arts and arts.__len__() > 0:
            GlobalUI.image_preview.build_arts_list()
            return
        def after():
            result = GlobalUI.image_preview.build_arts_list()
            if not result:
                Popup(GlobalUI.root, Strings.Current.CONNECTION_PROBLEM_TEXT, width=300, height=120, top_pad_y=10, after_destroy_callback=GlobalUI.image_preview.grab)
            else:
                GlobalUI.image_preview.grab()

        def task():
            loading = None
            try:
                lib_retro_arts = LibRetroArts(GlobalUI.proxy)
                loading = LoadingWindow(GlobalUI.root, lib_retro_arts.url)
                GlobalUI.set_art_boxes(platform, lib_retro_arts.get_file_names(PlatformsMeta.art_map[platform]))
            finally:
                if loading:
                    GlobalUI.root.after(0, loading.destroy)
                    GlobalUI.root.after(0, after)
        threading.Thread(target=task, daemon=True).start()

    @staticmethod
    def on_picked_image_click(platform, name):
        def after():
            if not GlobalUI.image_preview.is_loaded_image():
                Popup(GlobalUI.root, Strings.Current.IMAGE_NOT_LOADED_TEXT, width=300, height=120, top_pad_y=10, after_destroy_callback=GlobalUI.image_preview.grab)
            else:
                GlobalUI.image_preview.grab()
                GlobalUI.image_preview.build_new_art_view()
        def task():
            loading = None
            try:
                lib_retro_arts = LibRetroArts(GlobalUI.proxy)
                loading = LoadingWindow(GlobalUI.root, lib_retro_arts.url)
                GlobalUI.image_preview.loaded_image_buffer = lib_retro_arts.download_image(PlatformsMeta.art_map[platform], name)
            finally:
                if loading:
                    GlobalUI.root.after(0, loading.destroy)
                    GlobalUI.root.after(0, after)
        threading.Thread(target=task, daemon=True).start()

    @staticmethod
    def on_fav_click_listener(ui_num, new_value):
        GlobalUI.selected_rows[ui_num][1] = new_value

    @staticmethod
    def on_erase_history():
        def callback():
            Handlers.assign_value(2, 0)

        Handlers.on_erase(Strings.Current.HISTORY_WORD, callback)

    @staticmethod
    def on_erase(name, callback):
        if GlobalUI.get_games_num() == 0:
            return
        if GlobalUI.current_platform == GlobalUI.all:
            platform_name = Strings.Current.PLATFORMS_WORD
        else:
            platform_name = Strings.Current.PLATFORM_WORD
        message = Strings.Current.ON_ERASE_MESSAGE.replace('{%s1}', name).replace('{%s2}', GlobalUI.current_platform).replace('{%s3}', platform_name)
        ConfirmDialog(GlobalUI.root, message, callback)

    @staticmethod
    def on_erase_favorites():
        def callback():
            Handlers.assign_value(1, 0)
        Handlers.on_erase(Strings.Current.FAVORITES_WORD, callback)

    @staticmethod
    def on_ui_name_click(item, platform, file_name, ui_name, image_path):
        Handlers.on_name_click(item, file_name, platform, ui_name, image_path, False)

    @staticmethod
    def on_file_name_click(item, platform, file_name, ui_name, image_path):
        Handlers.on_name_click(item, file_name, platform, ui_name, image_path, True)

    @staticmethod
    def on_name_click(item, file_name, platform, ui_name, image_path, is_file_name):
        file_name_stem = Path(file_name).stem
        image_path_stem = Path(image_path).stem
        names_eq = file_name_stem == ui_name
        is_image_folder = False
        if image_path.startswith(GlobalUI.image_media_folder_name): # media folder
            is_image_folder = True
            image_path_stem = Path(image_path).parent.name
        if (names_eq and image_path == "") or names_eq and file_name_stem == image_path_stem:
            return
        if is_image_folder:
            part_a = Strings.Current.SYNCHRONIZE_TEXT_PART_B.replace('{%s1}', image_path_stem)
        else:
            part_a = Strings.Current.SYNCHRONIZE_TEXT_PART_A.replace('{%s1}', image_path_stem)
        name_a = Strings.Current.SYNCHRONIZE_TEXT_NAME_A.replace('{%s1}', ui_name)
        name_b = Strings.Current.SYNCHRONIZE_TEXT_NAME_B.replace('{%s1}', file_name_stem)
        if not is_file_name:
            name_c = name_a
            name_a = name_b
            name_b = name_c
        if image_path_stem == "":
            part_a = ""
        part1 = Strings.Current.SYNCHRONIZE_TEXT_PART_1.replace('{%s1}', name_a).replace('{%s2}', part_a).replace('{%s3}', name_b)
        part2 = Strings.Current.SYNCHRONIZE_TEXT_PART_2
        part3 = Strings.Current.SYNCHRONIZE_TEXT_PART_3
        part4 = Strings.Current.SYNCHRONIZE_TEXT_PART_4
        part5 = Strings.Current.SYNCHRONIZE_TEXT_PART_5
        part6 = Strings.Current.SYNCHRONIZE_TEXT_PART_6
        message = part1 + part2 + part3 + part4 + part5 + part6
        if is_file_name:
            target_name = file_name_stem
        else:
            target_name = ui_name
        ConfirmDialog(GlobalUI.root, message, lambda: Handlers.rename_files(target_name, item, platform, file_name, image_path), width=600, height=350, top_pad_y=20, close_before_callback=True)

    @staticmethod
    def update_names(item, platform, old_file_path, new_file_path):
        image_path = Handlers.try_to_get_existing_image_path(new_file_path.stem, platform)

        i = 0
        for game_path in GlobalUI.games_dict[platform]:
            if game_path == old_file_path:
                GlobalUI.games_dict[platform][i] = new_file_path
                break
            i += 1

        for game_row in GlobalUI.games_rows[platform]:
            if game_row[2] == old_file_path.name:
                game_row[2] = new_file_path.name
                game_row[3] = new_file_path.stem
                game_row[4] = image_path
                GlobalUI.games_table.set_names(item, game_row[2], game_row[3], game_row[4])
                break

    @staticmethod
    def rename_files(target_name, item, platform, file_name, image_path):
        is_media = image_path.startswith(GlobalUI.image_media_folder_name)
        extension = Path(file_name).suffix
        absolute_game_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + file_name)
        absolute_new_game_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + target_name + extension)
        if image_path == "":
            absolute_image_path = Path(image_path)
        else:
            if is_media:
                absolute_image_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + GlobalUI.image_media_folder_name + os.sep + Path(image_path).parent.name)
            else:
                absolute_image_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + image_path)
        if is_media:
            absolute_new_image_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + GlobalUI.image_media_folder_name + os.sep + target_name)
        else:
            absolute_new_image_path = Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + GlobalUI.image_folder_name + os.sep + target_name + GlobalUI.image_extension)

        # Rename only image if needed
        if absolute_game_path == absolute_new_game_path: # should not be here if an image is empty, check only not empty

            # try to rename image if it is not empty
            if image_path != "":
                if not Handlers.check_image_unique(platform, image_path):
                    message = Strings.Current.RENAME_FILES_TEXT_2.replace("{%s1}", str(absolute_image_path))
                    Popup(GlobalUI.root, message, top_pad_y=20)
                    return
                if is_media:
                    if not absolute_new_image_path.is_dir():
                        if absolute_image_path.is_dir():
                            absolute_image_path.rename(absolute_new_image_path)
                else:
                    if not absolute_new_image_path.is_file(): # should not be existed, check just in case
                        if absolute_image_path.is_file():
                            absolute_image_path.rename(absolute_new_image_path)
            Handlers.update_names(item, platform, absolute_game_path, absolute_new_game_path)
            return

        # the new file already exists
        if absolute_game_path != absolute_new_game_path and absolute_new_game_path.is_file():
            message = Strings.Current.RENAME_FILES_TEXT_1.replace('{%s1}', str(absolute_new_game_path))
            Popup(GlobalUI.root, message, top_pad_y=20)
            return

        # try to rename both
        if absolute_game_path.is_file():
            absolute_game_path.rename(absolute_new_game_path)
            if is_media:
                if not absolute_new_image_path.is_dir(): # new one does not exist yet
                    if absolute_image_path.is_dir(): # old one exists to rename
                        absolute_image_path.rename(absolute_new_image_path)
            else:
                # try to rename the image
                if not absolute_new_image_path.is_file():
                    if absolute_image_path.is_file():
                        absolute_image_path.rename(absolute_new_image_path)
            Handlers.update_names(item, platform, absolute_game_path, absolute_new_game_path)
        else: # a game file does not exist
            message = Strings.Current.RENAME_FILES_TEXT_3.replace('{%s1}', str(absolute_game_path))
            Popup(GlobalUI.root, message, top_pad_y=20)

    @staticmethod
    def try_to_get_existing_image_path(name, platform):
        if GlobalUI.get_absolute_image_path(platform, name).is_file():
            return GlobalUI.image_folder_name + "/" + name + GlobalUI.image_extension
        if GlobalUI.get_absolute_media_image_path(platform, name).is_file():
            return GlobalUI.image_media_folder_name + "/" + name + "/" + GlobalUI.standard_image_name
        return ""

    @staticmethod
    def check_image_unique(platform, image_path):
        counter = 0
        for item in GlobalUI.games_rows[platform]:
            curr_image_path = item[4]
            if image_path == curr_image_path:
                counter += 1
            if counter > 1:
                return False
        return True

    @staticmethod
    def on_row_click(image_path, platform):
        if image_path == "":
            full_path = image_path
        else:
            full_path = GlobalUI.roms_folder_path + os.sep + platform + os.sep + image_path
        GlobalUI.image_frame.on_picture_changed(full_path)

    @staticmethod
    def on_load_data():
        GlobalUI.image_frame.set_default_picture()
