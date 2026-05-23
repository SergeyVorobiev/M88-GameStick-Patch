import os
import sys
from pathlib import Path


class GlobalUI:
    app_width = 1600
    app_height = 900
    version = "v1.1"
    new_db_name = "cachegames(updated).db"
    db_name = "cachegames.db"
    github_url = "https://github.com/SergeyVorobiev/M88-GameStick-Patch"

    if getattr(sys, 'frozen', False):

        # noinspection PyUnresolvedReferences,PyProtectedMember
        base_path = Path(sys._MEIPASS)
    else:
        base_path = Path(__file__).parent

    icon = base_path / "Res" / "M88.ico" #"src/db/UI/Res/M88.ico"
    m88_image = base_path / "Res" / "M88.png" #'src/db/UI/Res/M88.png'
    image_extension = '.png'
    config_extension = ".xml"
    folder_path = ""
    roms_folder_path = ""
    games_table = None
    platforms_list = None
    folder_chooser = None
    control_panel = None
    image_preview = None
    image_frame = None
    footer_frame = None
    root = None
    all = "All"
    game_folder_name = "roms"
    image_folder_name = "images"
    image_media_folder_name = "media"
    standard_image_name = "boxFront.png"
    current_platform = "All"
    games_dict = {}
    games_rows = {}
    selected_rows = {} # uuid: [in_db, fav, his]
    db_data = {} # file_name: [image_path, ui_name, fav, his, gnum]

    @staticmethod
    def reset():
        GlobalUI.current_platform = GlobalUI.all
        GlobalUI.games_dict = {}
        GlobalUI.games_rows = {}
        GlobalUI.selected_rows = {}
        GlobalUI.db_data = {}

    @staticmethod
    def get_absolute_image_path(platform, name):
        return Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + GlobalUI.image_folder_name + os.sep + name + GlobalUI.image_extension)

    @staticmethod
    def get_absolute_media_image_path(platform, name):
        return Path(GlobalUI.roms_folder_path + os.sep + platform + os.sep + GlobalUI.image_media_folder_name + os.sep + name + os.sep + GlobalUI.standard_image_name)

    @staticmethod
    def get_games_num():
        if GlobalUI.current_platform == GlobalUI.all:
            total = 0
            for key, value in GlobalUI.games_rows.items():
                total += value.__len__()
            return total

        # noinspection PyBroadException
        try:
            return len(GlobalUI.games_rows[GlobalUI.current_platform])
        except:
            return 0
