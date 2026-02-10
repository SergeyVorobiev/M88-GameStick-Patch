from src.CMD import CMD
from src.Global import Global
from src.OtherTool import OtherTool


class RetroADB:

    RETRO32 = "com.retroarch.ra32"

    RETRO64 ="com.retroarch.aarch64"

    def __init__(self):
        ...

    @staticmethod
    def get_retro_package():
        CMD.run(["adb", "shell", "pm", "list", "packages", "|", "grep", "retro"])

    @staticmethod
    def run_main_menu_32():
        RetroADB.run_main_menu(RetroADB.RETRO32)

    @staticmethod
    def run_main_menu_64():
        RetroADB.run_main_menu(RetroADB.RETRO64)

    @staticmethod
    def run_main_menu(package):
        CMD.run(["adb", "shell", "am", "start", "--user", "0", "-n",
                 f"{package}/com.retroarch.browser.mainmenu.MainMenuActivity"])

    @staticmethod
    def backup_user_data(package, archive_path):
        OtherTool.make_dirs(OtherTool.get_folder_path_from_file_path(archive_path))
        CMD.run(["adb", "backup", "-apk", "-f", archive_path, package])

    @staticmethod
    def backup_user_data_32(archive_path=None):
        if archive_path is None:
            archive_path = "temp/retroarch32.ab"
        RetroADB.backup_user_data(RetroADB.RETRO32, archive_path)

    @staticmethod
    def backup_user_data_64(archive_path=None):
        if archive_path is None:
            archive_path = "temp/retroarch64.ab"
        RetroADB.backup_user_data(RetroADB.RETRO64, archive_path)

    @staticmethod
    def unpack_backup(archive_path=None, result_path=None):
        if archive_path is None:
            archive_path = "temp/retroarch32.ab"
        if result_path is None:
            result_path = "temp/retro32.tar"
        CMD.run(["java", "-jar", Global.abe, "unpack", archive_path, result_path])

    @staticmethod
    def install_retro_arch_32():
        CMD.run(["adb", "install", "img/original/apk/RetroArch_ra32.apk"])

    @staticmethod
    def install_retro_arch_64():
        CMD.run(["adb", "install", "img/original/apk/RetroArch_aarch64.apk"])

    @staticmethod
    def run_retro_arch_from_sdcard(sdcard_id="F164-AC9C"):
        external_sd = f"/storage/{sdcard_id}"
        rom_path = f"{external_sd}/roms/genesis/Aerobiz.zip"
        #libretro_path = f"{external_sd}/cores/genesis_plus_gx_libretro_android.so"
        libretro_path = "/data/user/0/com.retroarch.ra32/cores/genesis_plus_gx_libretro_android.so"
        config_path = f"{external_sd}/RetroArch/config.cfg"
        CMD.run(["adb", "shell", "am", "start", "--user", "0", "-n",
                 f"{RetroADB.RETRO32}/com.retroarch.browser.retroactivity.RetroActivityFuture",
                 "-e", "ROM", rom_path,
                 "-e", "LIBRETRO", libretro_path,
                 "-e", "CONFIGFILE", config_path,
                 "-e", "SDCARD", "/sdcard",
                 "-e", "EXTERNAL", external_sd,
                 "--activity-clear-top"])