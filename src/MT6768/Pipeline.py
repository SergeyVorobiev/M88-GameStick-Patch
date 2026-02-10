import hashlib
import os
import time
import urllib.request

from src.APKTool import APKTool
from src.AVBInfo import AVBInfo
from src.Ext4ModifyTool import Ext4ModifyTool
from src.Ext4UnpackTool import Ext4UnpackTool
from src.MagiskbootTool import MagiskbootTool
from src.MainSystemTool import MainSystemTool
from src.OtherTool import OtherTool
from src.SuperTool import SuperTool


class Pipeline:
    FINAL_USER_IMG_PATH = "img/updated/USER.img"

    ORIGINAL_USER_IMG_PATH = "img/original/USER.img"

    def __init__(self):
        ...

    @staticmethod
    def check_original_result_path_different():
        if Pipeline.FINAL_USER_IMG_PATH == Pipeline.ORIGINAL_USER_IMG_PATH:
            raise Exception("Original path and final path must be different")

    @staticmethod
    def replace_emu():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/app/emu/emu.apk")
        modify_tool.remove_file("system/app/emu/oat/arm/emu.odex")
        modify_tool.remove_file("system/app/emu/oat/arm/emu.vdex")
        modify_tool.add_file("img/updated/apk/emu.apk", "system/app/emu/emu.apk")

    @staticmethod
    def download_retro_arch_32_1222():
        local_path = "img/original/apk/RetroArch_ra32.apk"
        if os.path.exists(local_path):
            return
        OtherTool.make_dirs("img/original/apk")
        url = "https://buildbot.libretro.com/stable/1.22.2/android/RetroArch_ra32.apk"
        print("Download RetroArch:", url, "To:", local_path)
        urllib.request.urlretrieve(url, local_path)
        print(f"Done")

    @staticmethod
    def download_retro_arch_64_1222():
        local_path = "img/original/apk/RetroArch_aarch64.apk"
        if os.path.exists(local_path):
            return
        OtherTool.make_dirs("img/original/apk")
        url = "https://buildbot.libretro.com/stable/1.22.2/android/RetroArch_aarch64.apk"
        print("Download RetroArch:", url, "To:", local_path)
        urllib.request.urlretrieve(url, local_path)
        print(f"Done")

    @staticmethod
    def inject_system_into_user():
        offset = SuperTool.get_partition_offset("img/original/extracted/45.super.img", "system_a")
        OtherTool.inject("img/updated/system_a.img", "img/updated/45.super.img", offset)
        offset = MainSystemTool.find_offset(Pipeline.FINAL_USER_IMG_PATH, "45.super.img")
        OtherTool.inject("img/updated/45.super.img", Pipeline.FINAL_USER_IMG_PATH, offset)

    @staticmethod
    def compile_and_sign_emu():
        apk_tool = APKTool()
        apk_tool.compile_and_sign('img/updated/d_apk/emu', 'img/updated/apk/emu.apk')

    @staticmethod
    def compile_and_sign_retro_arch_32():
        apk_tool = APKTool()
        apk_tool.compile_and_sign('img/updated/d_apk/retroarch32', 'img/updated/apk/RetroArch_ra32.apk')

    @staticmethod
    def compile_and_sign_retro_arch_64():
        apk_tool = APKTool()
        apk_tool.compile_and_sign('img/updated/d_apk/retroarch64', 'img/updated/apk/RetroArch_aarch64.apk')

    @staticmethod
    def pack_boot_and_inject_into_user():
        Pipeline.pack_boot()
        Pipeline.inject_boot_into_user()

    @staticmethod
    def inject_boot_into_user():
        offset = MainSystemTool.find_offset(Pipeline.FINAL_USER_IMG_PATH, "23.boot_a.img")
        OtherTool.inject("img/updated/23.boot_a.img", Pipeline.FINAL_USER_IMG_PATH, offset)

    @staticmethod
    def inject_super_into_user():
        offset = MainSystemTool.find_offset(Pipeline.FINAL_USER_IMG_PATH, "45.super.img")
        OtherTool.inject("img/updated/45.super.img", Pipeline.FINAL_USER_IMG_PATH, offset)

    @staticmethod
    def pack_boot():
        magiskboot = MagiskbootTool()

        # Pack ramdisk
        magiskboot.pack_ramdisk("img/updated/boot/cpio", "img/updated/boot/ramdisk", "img/updated/boot/ramdisk.cpio")

        # Pack ramdisk, kernel, dtb to boot
        magiskboot.pack_boot("img/original/extracted/23.boot_a.img", "img/updated/boot", "img/updated/23.boot_a.img")

    @staticmethod
    def unpack_boot():
        magiskboot = MagiskbootTool()
        result_path = "img/original/extracted/boot"
        OtherTool.del_folder(result_path)
        magiskboot.unpack_boot("img/original/extracted/23.boot_a.img", result_path)
        magiskboot.unpack_ramdisk("img/original/extracted/boot/ramdisk.cpio", result_path)

    @staticmethod
    def decompile_retro_arch_32():
        apk_tool = APKTool()
        folder_path = "img/original/d_apk/retroarch32"
        OtherTool.del_folder(folder_path)
        apk_tool.decompile_into('img/original/d_apk/retroarch32', 'img/original/apk/RetroArch_ra32.apk')

    @staticmethod
    def decompile_retro_arch_64():
        apk_tool = APKTool()
        folder_path = "img/original/d_apk/retroarch64"
        OtherTool.del_folder(folder_path)
        apk_tool.decompile_into('img/original/d_apk/retroarch64', 'img/original/apk/RetroArch_aarch64.apk')

    @staticmethod
    def remove_retro_arch_32():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/priv-app/RetroArch_ra32/RetroArch_ra32.apk")
        modify_tool.remove_file('system/priv-app/RetroArch_ra32', is_file=False)

    @staticmethod
    def remove_retro_arch_64():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/priv-app/RetroArch_aarch64/RetroArch_aarch64.apk")
        modify_tool.remove_file('system/priv-app/RetroArch_aarch64', is_file=False)

    @staticmethod
    def add_retro_arch_32():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.add_file('img/updated/apk/RetroArch_ra32.apk', 'system/priv-app/RetroArch_ra32/RetroArch_ra32.apk')

    @staticmethod
    def add_retro_arch_64():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.add_file('img/updated/apk/RetroArch_aarch64.apk',
                             'system/priv-app/RetroArch_aarch64/RetroArch_aarch64.apk')

    @staticmethod
    def patch_privileges():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/etc/permissions/privapp-permissions-platform.xml")
        modify_tool.add_file('replace/system/privapp-permissions-platform.xml',
                             'system/etc/permissions/privapp-permissions-platform.xml', True, True)

    @staticmethod
    def decompile_emu():
        apk_tool = APKTool()
        emu_folder = "img/original/d_apk/emu"
        OtherTool.del_folder(emu_folder)
        apk_tool.decompile_into(emu_folder, 'img/original/apk/emu.apk')

    @staticmethod
    def decompile_n64():
        apk_tool = APKTool()
        n64_folder = "img/original/d_apk/n64"
        OtherTool.del_folder(n64_folder)
        apk_tool.decompile_into(n64_folder, 'img/original/apk/n64.apk')

    @staticmethod
    def copy_n64_to_updated():
        OtherTool.copy_folder("img/original/d_apk/n64", "img/updated/d_apk/n64")

    @staticmethod
    def compile_and_sign_n64():
        apk_tool = APKTool()
        apk_tool.compile_and_sign('img/updated/d_apk/n64', 'img/updated/apk/n64.apk')

    @staticmethod
    def resize_system_img(size):
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.resize_img(size)

    @staticmethod
    def check_original_hash():
        print("Checking original hash...")
        original_expected_hash = Pipeline.extract_user_expected_original_hash()
        original_actual_hash = Pipeline.extract_user_actual_original_hash()
        if original_expected_hash != original_actual_hash:
            raise Exception(
                f'Original hash does not match expected hash: {original_actual_hash} vs {original_expected_hash}')
        print("Done\n")

    @staticmethod
    def extract_user_expected_original_hash():
        with open("../resources/m88/sha512.txt", 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line.startswith('original USER - '):
                    return line[len('original USER - '):].strip()
            return ""

    @staticmethod
    def pack_super_m88():
        SuperTool.pack_super_m88(product_a_path="img/original/extracted/super/product_a.img",
                                 product_b_path="img/original/extracted/super/product_b.img",
                                 system_a_path="img/updated/system_a.img",
                                 system_b_path="img/original/extracted/super/system_b.img",
                                 vendor_a_path="img/original/extracted/super/vendor_a.img",
                                 vendor_b_path="img/original/extracted/super/vendor_b.img",
                                 original_super_path="img/original/extracted/45.super.img",
                                 result_super_path="img/updated/45.super.img")

    @staticmethod
    def extract_user_actual_original_hash():
        sha512 = hashlib.sha512()
        chunk_size = 1024 * 262144
        with open(Pipeline.ORIGINAL_USER_IMG_PATH, 'rb') as f:
            while chunk := f.read(chunk_size):
                sha512.update(chunk)

        return sha512.hexdigest()

    @staticmethod
    def unpack_user():
        result_folder = "img/original/extracted"
        OtherTool.del_folder(result_folder)
        OtherTool.make_dirs(result_folder)

        # Extract images from main image
        MainSystemTool.unpack_partitions(Pipeline.ORIGINAL_USER_IMG_PATH, result_folder)

    @staticmethod
    def unpack_super():

        # Extract super image
        SuperTool.lpunpack_image("img/original/extracted/45.super.img", "img/original/extracted/super")

    @staticmethod
    def unpack_system():

        # Print a footer of the system.img
        AVBInfo.print_info_image("img/original/extracted/super/system_a.img")

        # Unpack system.img
        Ext4UnpackTool.unpack("img/original/extracted/super/system_a.img", "img/original/extracted/super/system_a")

    @staticmethod
    def cure_boot():
        OtherTool.del_folder("img/updated/boot")
        OtherTool.copy_folder("img/original/extracted/boot", "img/updated/boot")
        fstab1_path = "img/updated/boot/ramdisk/first_stage_ramdisk/fstab.mt6768"
        fstab2_path = "img/updated/boot/ramdisk/first_stage_ramdisk/fstab.mt8786"
        OtherTool.del_file(fstab1_path)
        OtherTool.del_file(fstab2_path)
        OtherTool.copy_file("replace/boot/fstab.mt6768", fstab1_path)
        OtherTool.copy_file("replace/boot/fstab.mt8786", fstab2_path)

    @staticmethod
    def patch_retro_arch_32():
        OtherTool.copy_file("replace/retro32/AndroidManifest.xml", "img/updated/d_apk/retroarch32/AndroidManifest.xml")
        OtherTool.copy_file("replace/retro32/RetroActivityFuture.smali",
                            "img/updated/d_apk/retroarch32/smali/com/retroarch/browser/retroactivity/RetroActivityFuture.smali")
        Pipeline.compile_and_sign_retro_arch_32()
        Pipeline.remove_retro_arch_32()
        Pipeline.add_retro_arch_32()

    @staticmethod
    def patch_retro_arch_64():
        what = "replace/retro64/RetroActivityFuture.smali"
        where = "img/updated/d_apk/retroarch64/smali/com/retroarch/browser/retroactivity/RetroActivityFuture.smali"
        OtherTool.copy_file(what, where)
        what = "replace/retro64/AndroidManifest.xml"
        where = "img/updated/d_apk/retroarch64/AndroidManifest.xml"
        OtherTool.copy_file(what, where)
        Pipeline.compile_and_sign_retro_arch_64()
        Pipeline.remove_retro_arch_64()
        Pipeline.add_retro_arch_64()

    @staticmethod
    def patch_emu():
        OtherTool.copy_file("replace/emu/apktool.yml", "img/updated/d_apk/emu")
        OtherTool.copy_file("replace/emu/GameTemplate.smali",
                            "img/updated/d_apk/emu/smali/com/junction/fire/gametemplate/GameTemplate.smali")
        OtherTool.copy_file("replace/emu/RetroActivityFuture.smali",
                            "img/updated/d_apk/emu/smali/com/emu/browser/retroactivity/RetroActivityFuture.smali")
        Pipeline.compile_and_sign_emu()
        Pipeline.replace_emu()

    @staticmethod
    def patch_n64():
        what = "replace/n64/SplashActivity.smali"
        where = "img/updated/d_apk/n64/smali/paulscode/android/mupen64plusae/SplashActivity.smali"
        OtherTool.copy_file(what, where)
        Pipeline.compile_and_sign_n64()
        Pipeline.replace_n64()

    @staticmethod
    def replace_n64():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/app/n64/n64.apk")
        modify_tool.remove_file("system/app/n64/oat/arm/n64.odex")
        modify_tool.remove_file("system/app/n64/oat/arm/n64.vdex")
        modify_tool.add_file("img/updated/apk/n64.apk", "system/app/n64/n64.apk")

    @staticmethod
    def repack_boot():
        Pipeline.unpack_boot()
        Pipeline.cure_boot()
        Pipeline.pack_boot()

    @staticmethod
    def repack_n64():
        OtherTool.copy_file("img/original/extracted/super/system_a/system/app/n64/n64.apk", "img/original/apk/n64.apk")
        Pipeline.decompile_n64()
        updated_n64_folder = "img/updated/d_apk/n64"
        OtherTool.del_folder(updated_n64_folder)
        OtherTool.copy_folder("img/original/d_apk/n64", updated_n64_folder)
        Pipeline.patch_n64()

    @staticmethod
    def repack_emu():
        OtherTool.copy_file("img/original/extracted/super/system_a/system/app/emu/emu.apk", "img/original/apk/emu.apk")
        Pipeline.decompile_emu()
        updated_emu_folder = "img/updated/d_apk/emu"
        OtherTool.del_folder(updated_emu_folder)
        OtherTool.copy_folder("img/original/d_apk/emu", updated_emu_folder)
        Pipeline.patch_emu()

    @staticmethod
    def repack_retro_arch_32():
        Pipeline.decompile_retro_arch_32()
        updated_retro_folder = "img/updated/d_apk/retroarch32"
        OtherTool.del_folder(updated_retro_folder)
        OtherTool.copy_folder("img/original/d_apk/retroarch32", updated_retro_folder)
        Pipeline.patch_retro_arch_32()
        Pipeline.patch_privileges()

    @staticmethod
    def repack_user():
        start_time = time.perf_counter()
        Pipeline.check_original_result_path_different()
        Pipeline.download_retro_arch_32_1222()
        Pipeline.unpack_user()
        Pipeline.unpack_super()
        Pipeline.unpack_system()
        Pipeline.repack_boot()
        OtherTool.copy_file("img/original/extracted/super/system_a.img", "img/updated/system_a.img")
        Pipeline.resize_system_img("+500M")
        Pipeline.repack_retro_arch_32()
        Pipeline.repack_emu()
        Pipeline.repack_n64()
        Pipeline.pack_super_m88()
        OtherTool.copy_file(Pipeline.ORIGINAL_USER_IMG_PATH, Pipeline.FINAL_USER_IMG_PATH)
        Pipeline.inject_boot_into_user()
        Pipeline.inject_super_into_user()
        end_time = time.perf_counter()
        elapsed = end_time - start_time
        minutes = int(elapsed // 60)
        seconds = int(elapsed % 60)
        print("Patching is finished:", f"{minutes:02d}:{seconds:02d} sec.")