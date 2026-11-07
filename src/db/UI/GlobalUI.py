import os
import sys
import time
from pathlib import Path

from src.db import PlatformsMeta


class GlobalUI:
    app_width = 1600
    app_height = 900
    proxy_example = '192.168.8.105:1080'
    proxy_type = "socks5"
    proxy_address = ''
    proxy_name = ''
    proxy_password = ''
    version = "v2.0"
    fw_version = "v2.3"
    img_ver = "2.3"
    min_version = "v2.0"
    firmware_folder = "M88FW"
    applauncher = "applauncher"
    applauncher_path = firmware_folder + "/apk/" + applauncher + ".apk"
    apps_folder = "Apps"
    exec_folder = firmware_folder + "/exec"
    lpunpack = exec_folder + "/lpunpack.exe"
    debugfs = exec_folder + "/debugfs.exe"
    truncate = exec_folder + "/truncate.exe"
    resize2fs = exec_folder + "/resize2fs.exe"
    magiskboot = exec_folder + "/magiskboot.exe"
    mke2fs = exec_folder + "/mke2fs.exe"
    lpmake = exec_folder + "/lpmake.exe"
    jdk17 = exec_folder + "/jdk17"
    apktool = exec_folder + "/apktool.jar"
    apksigner = exec_folder + "/signer/apksigner.bat"
    mykeystore = exec_folder + "/signer/my.keystore"
    pk8_path = "user.pk8"
    pem_path = "user.x509.pem"
    supported_firmware_versions = [version]
    app_name = "M88GDBTool"
    user_file = "USER.img"
    new_db_name = "cachegames(updated).db"
    db_name = "cachegames.db"
    github_url = "https://github.com/SergeyVorobiev/M88-GameStick-Patch"
    repo_latest_url = "https://api.github.com/repos/SergeyVorobiev/M88-GameStick-Patch/releases/latest"
    m88fw_url = "https://github.com/SergeyVorobiev/M88-GameStick-Patch/releases/latest/download/M88FW.7z"
    apps_url = "https://github.com/SergeyVorobiev/M88-GameStick-Patch/releases/latest/download/Apps.7z"
    if getattr(sys, 'frozen', False):

        # noinspection PyUnresolvedReferences,PyProtectedMember
        base_path = Path(sys._MEIPASS)
    else:
        base_path = Path(__file__).parent

    icon = base_path / "Res" / "M88.ico" #"src/db/UI/Res/M88.ico"
    m88_image = base_path / "Res" / "M88.png" #'src/db/UI/Res/M88.png'
    image_extension = '.png'
    config_extension = ".xml"
    initial_dir = "/"
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
    art_boxes = {}

    @staticmethod
    def get_proxy():
        proxy = ''
        if GlobalUI.proxy_address is not None and GlobalUI.proxy_address.__len__() > 0:
            proxy = GlobalUI.proxy_type + "://" + GlobalUI.proxy_address
        return proxy

    @staticmethod
    def get_art_boxes(platform):
        return GlobalUI.art_boxes.get(PlatformsMeta.art_map[platform])

    @staticmethod
    def set_art_boxes(platform, art_boxes):
        GlobalUI.art_boxes[PlatformsMeta.art_map[platform]] = art_boxes

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
    def format_size(size, maxi=None):
        appropriate = str(size) + " B"
        for unit in ['B', 'KB', 'MB', "GB", "TB", "PB"]:
            if size.is_integer():
                appropriate = str(int(size)) + " " + unit
            if size < 1024 or (maxi is not None and maxi == unit):
                if size.is_integer():
                    return str(int(size)) + " " + unit
                else:
                    return appropriate
            size /= 1024
        return appropriate

    @staticmethod
    def get_time(start_time):
        end_time = time.perf_counter()
        elapsed = end_time - start_time
        minutes = int(elapsed // 60)
        seconds = int(elapsed % 60)
        return f"{minutes:02d}:{seconds:02d}"

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
