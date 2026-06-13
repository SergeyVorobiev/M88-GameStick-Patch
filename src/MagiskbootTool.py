import os

from src.CMD import CMD
from src.Global import Global
from src.OtherTool import OtherTool


class MagiskbootTool:

    def __init__(self, magiskboot_path=None):
        if magiskboot_path is None:
            self.magiskboot_path = Global.magiskboot
        else:
            self.magiskboot_path = magiskboot_path

    def unpack_boot(self, img_path, result_folder, printc=None):
        CMD.run([self.magiskboot_path , "unpack", img_path], printc=printc)
        os.makedirs(result_folder, exist_ok=True)
        OtherTool.move_file("dtb", result_folder, printc)
        OtherTool.move_file("kernel", result_folder, printc)
        OtherTool.move_file("ramdisk.cpio", result_folder, printc)

    def unpack_ramdisk(self, ram_disk_path, result_folder, printc):
        os.makedirs(result_folder, exist_ok=True)
        CMD.run([self.magiskboot_path, "cpio", ram_disk_path, "extract"], printc=printc)
        OtherTool.move_file("cpio", result_folder, printc)
        OtherTool.move_file("ramdisk", result_folder, printc)

    def pack_ramdisk(self, cpio_config_path, cpio_folder_path, result_ram_disk_path, printc=None):
        folder_path = OtherTool.get_folder_path_from_file_path(result_ram_disk_path)
        os.makedirs(folder_path, exist_ok=True)
        OtherTool.del_file(result_ram_disk_path, printc)
        CMD.run([self.magiskboot_path, "cpio", "pack", "-c", cpio_config_path, cpio_folder_path, result_ram_disk_path], printc=printc)

    # src_folder - a folder with dtb, kernel, ramdisk.cpio to pack
    def pack_boot(self, original_img_path, src_folder, result_img_path, printc=None):
        OtherTool.copy_file(self.magiskboot_path, src_folder, printc=printc)
        norm_src_folder = os.path.normpath(src_folder)
        new_magiskboot = os.path.join(norm_src_folder, OtherTool.get_file_name_from_file_path(self.magiskboot_path))
        original_img_path_abs = os.path.abspath(original_img_path)
        result_img_path_abs = os.path.abspath(result_img_path)
        CMD.run([new_magiskboot, "repack", original_img_path_abs, result_img_path_abs], cwd=norm_src_folder, printc=printc)
        OtherTool.del_file(new_magiskboot, printc=printc)