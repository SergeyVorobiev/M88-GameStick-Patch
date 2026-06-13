import hashlib
import os
import time
import urllib.request
from pathlib import Path

from src.APKTool import APKTool
from src.Ext4ModifyTool import Ext4ModifyTool
from src.Ext4UnpackTool import Ext4UnpackTool
from src.MagiskbootTool import MagiskbootTool
from src.MainSystemTool import MainSystemTool
from src.OtherTool import OtherTool
from src.SuperTool import SuperTool


class Pipeline:
    FINAL_USER_IMG_PATH = "img/result/USER.img"

    ORIGINAL_USER_IMG_PATH = "img/original/USER.img"

    def __init__(self):
        ...

    @staticmethod
    def check_original_result_path_different():
        if Pipeline.FINAL_USER_IMG_PATH == Pipeline.ORIGINAL_USER_IMG_PATH:
            raise Exception("Original path and final path must be different")

    @staticmethod
    def replace_emu(updated_system_path="img/updated/system_a.img", updated_emu_apk_path="img/updated/apk/emu.apk", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.remove_file("system/app/emu/emu.apk", debugfs=debugfs, printc=printc)
        modify_tool.remove_file("system/app/emu/oat/arm/emu.odex", debugfs=debugfs, printc=printc)
        modify_tool.remove_file("system/app/emu/oat/arm/emu.vdex", debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_emu_apk_path, "system/app/emu/emu.apk", debugfs=debugfs, printc=printc)

    @staticmethod
    def download_retro_arch_32_1222():
        local_path = "img/original/apk/RetroArch_ra32.apk"
        url = "https://buildbot.libretro.com/stable/1.22.2/android/RetroArch_ra32.apk"
        if not os.path.exists(local_path):
            raise Exception("Please download RetroArch manually from: " + url + " and place it into: " + str(Path(local_path).absolute()))
        print(f"Done")
        return
        local_path = "img/original/apk/RetroArch_ra32.apk"
        default_sha = "0adde7f83a41e815ef2904ed983d94c498212336f75fa7d2a2074b5b0ea3b40f8a28d80ceea59d1b45f1f5b4b49c3ad0c750dcf8395dca5b077c7fcd347c10b8"
        if os.path.exists(local_path):
            sha512 = Pipeline.get_sha512(local_path)
            if sha512 != default_sha:
                raise Exception("Wrong sha512 for RetroArch:", Path(local_path).absolute(), "delete this one and try again or download it manually.")
        OtherTool.make_dirs("img/original/apk")
        url = "https://buildbot.libretro.com/stable/1.22.2/android/RetroArch_ra32.apk"
        print("Downloading RetroArch:", url, "To:", local_path, "\n if you have problems with connection, please download it manually from here:", url)

        urllib.request.urlretrieve(url, local_path)
        if os.path.exists(local_path):
            sha512 = Pipeline.get_sha512(local_path)
            if sha512 != default_sha:
                raise Exception("Wrong sha512 for RetroArch:", Path(local_path).absolute(), "delete this one and try again or download it manually.")
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
    def compile_and_sign_retro_arch_32(apk_tool_path=None, apk_signer_path=None, updated_folder_path='img/updated/d_apk/retroarch32', updated_apk_path='img/updated/apk/RetroArch_ra32.apk', keystore=None, printc=None, java=None):
        apk_tool = APKTool(apk_tool_path, apk_signer_path, java)
        apk_tool.compile_and_sign(updated_folder_path, updated_apk_path, keystore, printc)

    @staticmethod
    def compile_and_sign(apk_tool_path, apk_signer_path, updated_folder_path, updated_apk_path, keystore, printc=None, java=None):
        apk_tool = APKTool(apk_tool_path, apk_signer_path, java)
        apk_tool.compile_and_sign(updated_folder_path, updated_apk_path, keystore, printc)

    @staticmethod
    def compile_and_sign_retro_arch_64():
        apk_tool = APKTool()
        apk_tool.compile_and_sign('img/updated/d_apk/retroarch64', 'img/updated/apk/RetroArch_aarch64.apk')

    @staticmethod
    def pack_boot_and_inject_into_user():
        Pipeline.pack_boot()
        Pipeline.inject_boot_into_user()

    @staticmethod
    def inject_boot_into_user(updated_boot_path="img/updated/23.boot_a.img", result_user_path=None, printc=None):
        if result_user_path is None:
            result_user_path = Pipeline.FINAL_USER_IMG_PATH
        offset = MainSystemTool.find_offset(result_user_path, "23.boot_a.img")
        OtherTool.inject(updated_boot_path, result_user_path, offset, printc)

    @staticmethod
    def inject_super_into_user(updated_super_path="img/updated/45.super.img", result_user_path=None, printc=None):
        if result_user_path is None:
            result_user_path = Pipeline.FINAL_USER_IMG_PATH
        offset = MainSystemTool.find_offset(result_user_path, "45.super.img")
        OtherTool.inject(updated_super_path, result_user_path, offset, printc)

    @staticmethod
    def pack_boot(magiskboot_path=None, updated_boot_folder_path="img/updated/boot", original_boot_path="img/original/extracted/23.boot_a.img", updated_boot_path="img/updated/23.boot_a.img", printc=None):
        magiskboot = MagiskbootTool(magiskboot_path)

        # Pack ramdisk
        magiskboot.pack_ramdisk(updated_boot_folder_path + "/cpio", updated_boot_folder_path + "/ramdisk", updated_boot_folder_path + "/ramdisk.cpio", printc)

        # Pack ramdisk, kernel, dtb to boot
        magiskboot.pack_boot(original_boot_path, updated_boot_folder_path,  updated_boot_path, printc)

    @staticmethod
    def unpack_boot(magiskboot_path=None, original_boot_folder_path="img/original/extracted/boot", original_boot_path="img/original/extracted/23.boot_a.img", printc=None):
        magiskboot = MagiskbootTool(magiskboot_path)
        OtherTool.del_folder(original_boot_folder_path, printc)
        magiskboot.unpack_boot(original_boot_path, original_boot_folder_path, printc)
        magiskboot.unpack_ramdisk(original_boot_folder_path + "/ramdisk.cpio", original_boot_folder_path, printc)

    @staticmethod
    def decompile_retro_arch_32(folder_path="img/original/d_apk/retroarch32", apk_path='img/original/apk/RetroArch_ra32.apk', apk_tool_path=None, apk_signer_path=None, printc=None, java=None):
        apk_tool = APKTool(apk_tool_path, apk_signer_path, java)
        OtherTool.del_folder(folder_path, printc)
        apk_tool.decompile_into(folder_path, apk_path, printc)

    @staticmethod
    def decompile_retro_arch_64():
        apk_tool = APKTool()
        folder_path = "img/original/d_apk/retroarch64"
        OtherTool.del_folder(folder_path)
        apk_tool.decompile_into('img/original/d_apk/retroarch64', 'img/original/apk/RetroArch_aarch64.apk')

    @staticmethod
    def remove_retro_arch_32(updated_system_path="img/updated/system_a.img", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.remove_file("system/priv-app/RetroArch_ra32/RetroArch_ra32.apk", debugfs=debugfs, printc=printc)
        modify_tool.remove_file('system/priv-app/RetroArch_ra32', is_file=False, debugfs=debugfs, printc=printc)

    @staticmethod
    def remove_retro_arch_64():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/priv-app/RetroArch_aarch64/RetroArch_aarch64.apk")
        modify_tool.remove_file('system/priv-app/RetroArch_aarch64', is_file=False)

    @staticmethod
    def add_retro_arch_32(updated_system_path="img/updated/system_a.img", updated_apk_path='img/updated/apk/RetroArch_ra32.apk', printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.add_file(updated_apk_path, 'system/priv-app/RetroArch_ra32/RetroArch_ra32.apk', printc=printc)

    @staticmethod
    def add_retro_arch_64():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.add_file('img/updated/apk/RetroArch_aarch64.apk',
                             'system/priv-app/RetroArch_aarch64/RetroArch_aarch64.apk')

    @staticmethod
    def patch_privileges(updated_system_path="img/updated/system_a.img", replace_system_path="replace/system", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.remove_file("system/etc/permissions/privapp-permissions-platform.xml", debugfs=debugfs, printc=printc)
        modify_tool.add_file(replace_system_path + "/privapp-permissions-platform.xml",
                             'system/etc/permissions/privapp-permissions-platform.xml', True, True, debugfs, printc)

    @staticmethod
    def decompile_emu(original_emu_d_apk_path="img/original/d_apk/emu", original_emu_apk_path='img/original/apk/emu.apk', apk_tool=None, apk_signer=None, printc=None, java=None):
        apk_tool = APKTool(apk_tool, apk_signer, java)
        OtherTool.del_folder(original_emu_d_apk_path, printc)
        apk_tool.decompile_into(original_emu_d_apk_path, original_emu_apk_path, printc)

    @staticmethod
    def decompile_n64(original_n64_d_apk_path="img/original/d_apk/n64", original_n64_apk_path='img/original/apk/n64.apk', apk_tool=None, apk_signer=None, printc=None, java=None):
        apk_tool = APKTool(apk_tool, apk_signer, java)
        OtherTool.del_folder(original_n64_d_apk_path, printc)
        apk_tool.decompile_into(original_n64_d_apk_path, original_n64_apk_path, printc)

    @staticmethod
    def decompile_yaba():
        apk_tool = APKTool()
        yaba_folder = "img/original/d_apk/yaba"
        OtherTool.del_folder(yaba_folder)
        apk_tool.decompile_into(yaba_folder, 'img/original/apk/Yaba.apk')

    @staticmethod
    def copy_n64_to_updated():
        OtherTool.copy_folder("img/original/d_apk/n64", "img/updated/d_apk/n64")

    @staticmethod
    def compile_and_sign_n64(updated_d_apk_n64_path='img/updated/d_apk/n64',
                             updated_apk_n64_path='img/updated/apk/n64.apk', apk_tool_path=None, apk_signer_path=None,
                             keystore=None, printc=None, java=None):
        apk_tool = APKTool(apk_tool_path, apk_signer_path, java)
        apk_tool.compile_and_sign(updated_d_apk_n64_path, updated_apk_n64_path, keystore, printc)

    @staticmethod
    def compile_and_sign_emu(updated_d_apk_emu_path='img/updated/d_apk/emu',
                             updated_apk_emu_path='img/updated/apk/emu.apk', apk_tool_path=None, apk_signer_path=None,
                             keystore=None, printc=None, java=None):
        apk_tool = APKTool(apk_tool_path, apk_signer_path, java)
        apk_tool.compile_and_sign(updated_d_apk_emu_path, updated_apk_emu_path, keystore, printc)

    @staticmethod
    def compile_and_sign_yaba():
        apk_tool = APKTool()
        apk_tool.compile_and_sign('img/updated/d_apk/yaba', 'img/updated/apk/Yaba.apk')

    @staticmethod
    def resize_system_img(size, path="img/updated/system_a.img", truncate=None, resize2fs=None, printc=None):
        modify_tool = Ext4ModifyTool(path)
        modify_tool.resize_img(size, truncate, resize2fs, printc)

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
                                 vendor_a_path="img/updated/vendor_a.img",
                                 #vendor_a_path="img/original/extracted/super/vendor_a.img",
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
    def get_sha512(path):
        sha512 = hashlib.sha512()
        chunk_size = 1024 * 1024
        with open(path, 'rb') as f:
            while chunk := f.read(chunk_size):
                sha512.update(chunk)
        return sha512.hexdigest()

    @staticmethod
    def unpack_user(user_path=None, result_folder="img/original/extracted", printc=None, del_folder=True):
        if user_path is None:
            user_path = Pipeline.ORIGINAL_USER_IMG_PATH
        if del_folder:
            OtherTool.del_folder(result_folder, printc)
        OtherTool.make_dirs(result_folder)

        # Extract images from main image
        MainSystemTool.unpack_partitions(user_path, result_folder, printc)

    @staticmethod
    def unpack_super(image_path="img/original/extracted/45.super.img", result_folder_path="img/original/extracted/super", lpunpack=None, printc=None):

        # Extract super image
        SuperTool.lpunpack_image(image_path, result_folder_path, lpunpack, printc)

    @staticmethod
    def unpack_system(what="img/original/extracted/super/system_a.img", where="img/original/extracted/super/system_a", debugfs=None, printc=None):

        # Print a footer of the system.img
        # AVBInfo.print_info_image("img/original/extracted/super/system_a.img")

        # Unpack system.img
        Ext4UnpackTool.unpack(what, where, debugfs, printc)

    @staticmethod
    def unpack_vendor(what="img/original/extracted/super/vendor_a.img", where="img/original/extracted/super/vendor_a", debugfs=None, printc=None):
        Ext4UnpackTool.unpack(what, where, debugfs, printc)

    @staticmethod
    def cure_boot(updated_boot_folder_path="img/updated/boot", original_boot_folder_path="img/original/extracted/boot", replace_boot="replace/boot", printc=None):
        OtherTool.del_folder(updated_boot_folder_path, printc)
        OtherTool.copy_folder(original_boot_folder_path, updated_boot_folder_path, printc)
        fstab1_path = updated_boot_folder_path + "/ramdisk/first_stage_ramdisk/fstab.mt6768"
        fstab2_path = updated_boot_folder_path + "/ramdisk/first_stage_ramdisk/fstab.mt8786"
        OtherTool.del_file(fstab1_path, printc)
        OtherTool.del_file(fstab2_path, printc)
        OtherTool.copy_file(replace_boot + "/fstab.mt6768", fstab1_path, printc=printc)
        OtherTool.copy_file(replace_boot + "/fstab.mt8786", fstab2_path, printc=printc)

    # deprecated
    @staticmethod
    def modify_system_build_prop():
        OtherTool.make_dirs("img/updated/system")
        OtherTool.copy_file("img/original/extracted/super/system_a/system/build.prop", "img/updated/system/build.prop")
        lines_to_add = OtherTool.read_file_lines("replace/system/build_add.prop")
        OtherTool.add_lines_to_file("img/updated/system/build.prop", lines_to_add)

        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/build.prop")
        modify_tool.add_file("img/updated/system/build.prop", "system/build.prop")

    # deprecated
    @staticmethod
    def modify_vendor_build_prop():
        OtherTool.make_dirs("img/updated/vendor")
        OtherTool.copy_file("img/original/extracted/super/vendor_a/build.prop", "img/updated/vendor/build.prop")
        lines_to_add = OtherTool.read_file_lines("replace/system/build_add.prop")
        OtherTool.add_lines_to_file("img/updated/vendor/build.prop", lines_to_add)

        modify_tool = Ext4ModifyTool("img/updated/vendor_a.img")
        modify_tool.remove_file("build.prop")
        modify_tool.add_file("img/updated/vendor/build.prop", "build.prop")

    @staticmethod
    def patch_retro_arch_32(replace_folder_path="replace/retro32", updated_d_apk_path="img/updated/d_apk/retroarch32", apk_tool_path=None, apk_signer_path=None, updated_apk_path='img/updated/apk/RetroArch_ra32.apk', updated_system_path="img/updated/system_a.img", debugfs=None, keystore=None, printc=None, java=None):
        manifest = replace_folder_path + "/AndroidManifest.xml"
        future = replace_folder_path + "/RetroActivityFuture.smali"
        OtherTool.copy_file(manifest, updated_d_apk_path + "/AndroidManifest.xml", printc=printc)
        OtherTool.copy_file(future,
                            updated_d_apk_path + "/smali/com/retroarch/browser/retroactivity/RetroActivityFuture.smali", printc=printc)
        Pipeline.compile_and_sign_retro_arch_32(apk_tool_path, apk_signer_path, updated_d_apk_path, updated_apk_path, keystore, printc, java)
        Pipeline.remove_retro_arch_32(updated_system_path, debugfs, printc)
        Pipeline.add_retro_arch_32(updated_system_path, updated_apk_path, printc)

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
    def patch_emu(updated_apk_emu_path='img/updated/apk/emu.apk',
                  updated_d_apk_emu_path='img/updated/d_apk/emu',
                  replace_emu_path="replace/emu",
                  updated_system_path="img/updated/system_a.img",
                  apk_tool_path=None,
                  apk_signer_path=None,
                  keystore=None,
                  debugfs=None,
                  printc=None,
                  java=None):
        OtherTool.copy_file(replace_emu_path + "/apktool.yml", updated_d_apk_emu_path, printc=printc)
        OtherTool.copy_file(replace_emu_path + "/GameTemplate.smali",
                            updated_d_apk_emu_path + "/smali/com/junction/fire/gametemplate/GameTemplate.smali", printc=printc)
        OtherTool.copy_file(replace_emu_path + "/RetroActivityFuture.smali",
                            updated_d_apk_emu_path + "/smali/com/emu/browser/retroactivity/RetroActivityFuture.smali", printc=printc)
        Pipeline.compile_and_sign_emu(updated_d_apk_emu_path, updated_apk_emu_path, apk_tool_path, apk_signer_path, keystore, printc, java)
        Pipeline.replace_emu(updated_system_path, updated_apk_emu_path, debugfs, printc)

    @staticmethod
    def patch_n64(updated_apk_n64_path='img/updated/apk/n64.apk',
                  updated_d_apk_n64_path='img/updated/d_apk/n64',
                  replace_n64_path="replace/n64",
                  updated_system_path="img/updated/system_a.img",
                  apk_tool_path=None,
                  apk_signer_path=None,
                  keystore=None,
                  debugfs=None,
                  printc=None,
                  java=None):
        what = replace_n64_path + "/SplashActivity.smali"
        where = updated_d_apk_n64_path + "/smali/paulscode/android/mupen64plusae/SplashActivity.smali"
        OtherTool.copy_file(what, where, printc=printc)
        Pipeline.compile_and_sign_n64(updated_d_apk_n64_path, updated_apk_n64_path, apk_tool_path, apk_signer_path, keystore, printc, java)
        Pipeline.replace_n64(updated_system_path, updated_apk_n64_path, debugfs, printc)

    @staticmethod
    def patch_yaba():
        what = "replace/yaba/Yabause.smali"
        where = "img/updated/d_apk/yaba/smali_classes2/org/uoyabause/android/Yabause.smali"
        OtherTool.copy_file(what, where)
        Pipeline.compile_and_sign_yaba()
        Pipeline.replace_yaba()

    @staticmethod
    def replace_n64(updated_system_path="img/updated/system_a.img", updated_n64_apk_path="img/updated/apk/n64.apk", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.remove_file("system/app/n64/n64.apk", debugfs=debugfs, printc=printc)
        modify_tool.remove_file("system/app/n64/oat/arm/n64.odex", debugfs=debugfs, printc=printc)
        modify_tool.remove_file("system/app/n64/oat/arm/n64.vdex", debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_n64_apk_path, "system/app/n64/n64.apk", debugfs=debugfs, printc=printc)

    @staticmethod
    def replace_audio_device(updated_vendor_path="img/updated/vendor_a.img", replace_audio_path="replace/audio", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_vendor_path)
        modify_tool.remove_file("etc/audio_device.xml", debugfs=debugfs, printc=printc)
        modify_tool.add_file(replace_audio_path + "/vendor/audio_device.xml",
                             "etc/audio_device.xml", debugfs=debugfs, printc=printc)

    @staticmethod
    def replace_yaba():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/preinstall/Yaba.apk")
        modify_tool.add_file("img/updated/apk/Yaba.apk", "system/preinstall/Yaba.apk")

    @staticmethod
    def repack_boot(magiskboot_path=None,
                    original_boot_folder_path="img/original/extracted/boot",
                    original_boot_path="img/original/extracted/23.boot_a.img",
                    updated_boot_folder_path="img/updated/boot",
                    updated_boot_path="img/updated/23.boot_a.img",
                    replace_boot="replace/boot",
                    printc=None):
        Pipeline.unpack_boot(magiskboot_path, original_boot_folder_path, original_boot_path, printc)
        Pipeline.cure_boot(updated_boot_folder_path, original_boot_folder_path, replace_boot, printc)
        Pipeline.pack_boot(magiskboot_path, updated_boot_folder_path, original_boot_path, updated_boot_path, printc)

    # not ready
    @staticmethod
    def repack_yaba():

        # noinspection PyBroadException
        try:
            #OtherTool.copy_file("img/original/extracted/super/system_a/system/preinstall/Yaba.apk", "img/original/apk/Yaba.apk")
            #Pipeline.decompile_yaba()
            #updated_yaba_folder = "img/updated/d_apk/Yaba"
            #OtherTool.del_folder(updated_yaba_folder)
            #OtherTool.copy_folder("img/original/d_apk/yaba", updated_yaba_folder)
            Pipeline.patch_yaba()
        except:
            ... # In case if in earlier versions there is no yaba just try to skip silently

    @staticmethod
    def repack_emu(extracted_path="img/original/extracted",
                   original_emu_apk_path="img/original/apk/emu.apk",
                   original_emu_d_apk_path="img/original/d_apk/emu",
                   updated_emu_apk_path='img/updated/apk/emu.apk',
                   updated_emu_d_apk_path="img/updated/d_apk/emu",
                   replace_emu_path="replace/emu",
                   updated_system_path="img/updated/system_a.img",
                   apk_tool_path=None,
                   apk_signer_path=None,
                   keystore=None,
                   debugfs=None,
                   printc=None,
                   java=None):
        OtherTool.copy_file(extracted_path + "/super/system_a/system/app/emu/emu.apk", original_emu_apk_path, create_folders=True, printc=printc)
        Pipeline.decompile_emu(original_emu_d_apk_path, original_emu_apk_path, apk_tool_path, apk_signer_path, printc=printc, java=java)
        OtherTool.del_folder(updated_emu_d_apk_path, printc)
        OtherTool.copy_folder(original_emu_d_apk_path, updated_emu_d_apk_path, printc)
        Pipeline.patch_emu(updated_emu_apk_path,
                           updated_emu_d_apk_path,
                           replace_emu_path,
                           updated_system_path,
                           apk_tool_path,
                           apk_signer_path,
                           keystore,
                           debugfs,
                           printc,
                           java)

    @staticmethod
    def repack_n64(extracted_path="img/original/extracted",
                   original_n64_apk_path="img/original/apk/n64.apk",
                   original_n64_d_apk_path="img/original/d_apk/n64",
                   updated_n64_apk_path='img/updated/apk/n64.apk',
                   updated_n64_d_apk_path="img/updated/d_apk/n64",
                   replace_n64_path="replace/n64",
                   updated_system_path="img/updated/system_a.img",
                   apk_tool_path=None,
                   apk_signer_path=None,
                   keystore=None,
                   debugfs=None,
                   printc=None,
                   java=None):
        OtherTool.copy_file(extracted_path + "/super/system_a/system/app/n64/n64.apk", original_n64_apk_path, printc=printc)
        Pipeline.decompile_n64(original_n64_d_apk_path, original_n64_apk_path, apk_tool_path, apk_signer_path, printc=printc, java=java)
        OtherTool.del_folder(updated_n64_d_apk_path, printc)
        OtherTool.copy_folder(original_n64_d_apk_path, updated_n64_d_apk_path, printc)
        Pipeline.patch_n64(updated_n64_apk_path,
                           updated_n64_d_apk_path,
                           replace_n64_path,
                           updated_system_path,
                           apk_tool_path,
                           apk_signer_path,
                           keystore,
                           debugfs,
                           printc,
                           java)

    @staticmethod
    def repack_retro_arch_32(original_d_apk_retroarch_path="img/original/d_apk/retroarch32",
                             updated_d_apk_retroarch_path="img/updated/d_apk/retroarch32",
                             replace_retroarch_path="replace/retro32",
                             replace_system_path = "replace/system",
                             apk_path='img/original/apk/RetroArch_ra32.apk',
                             updated_apk_path = 'img/updated/apk/RetroArch_ra32.apk',
                             updated_system_path="img/updated/system_a.img",
                             apk_tool_path=None,
                             apk_signer_path=None,
                             debugfs=None,
                             keystore=None,
                             printc=None,
                             java=None):
        OtherTool.del_folder(updated_d_apk_retroarch_path, printc)
        Pipeline.decompile_retro_arch_32(original_d_apk_retroarch_path, apk_path, apk_tool_path, apk_signer_path, printc, java)
        OtherTool.copy_folder(original_d_apk_retroarch_path, updated_d_apk_retroarch_path, printc)
        Pipeline.patch_retro_arch_32(replace_retroarch_path, updated_d_apk_retroarch_path, apk_tool_path, apk_signer_path, updated_apk_path, updated_system_path, debugfs, keystore, printc, java)
        Pipeline.patch_privileges(updated_system_path, replace_system_path, debugfs, printc)

    @staticmethod
    def print_past_time(start_time):
        end_time = time.perf_counter()
        elapsed = end_time - start_time
        minutes = int(elapsed // 60)
        seconds = int(elapsed % 60)
        print("\nPatching finished:", f"{minutes:02d}:{seconds:02d} sec.")

    @staticmethod
    def remove_temps():
        OtherTool.del_folder("img/original/d_apk")
        OtherTool.del_file("img/original/apk/emu.apk")
        OtherTool.del_file("img/original/apk/n64.apk")
        OtherTool.del_folder("img/original/extracted")
        OtherTool.del_folder("img/updated")

    @staticmethod
    def is_retro_arch_exists(system_path="img/original/extracted/super/system_a.img", debugfs=None, printc=None):
        return Ext4ModifyTool(system_path).check_file_exists("/system/priv-app/RetroArch_ra32/RetroArch_ra32.apk", debugfs, printc)

    @staticmethod
    def repack_user(fix_audio, is_remove_temps=True):
        try:
            start_time = time.perf_counter()
            Pipeline.check_original_result_path_different()
            Pipeline.unpack_user()
            Pipeline.unpack_super()
            Pipeline.unpack_system()
            OtherTool.copy_file("img/original/extracted/super/system_a.img", "img/updated/system_a.img", True)
            if not Pipeline.is_retro_arch_exists():
                Pipeline.download_retro_arch_32_1222()
                Pipeline.resize_system_img("+500M")
                Pipeline.repack_retro_arch_32()
            Pipeline.repack_emu()
            Pipeline.repack_n64()
            Pipeline.unpack_vendor()
            OtherTool.copy_file("img/original/extracted/super/vendor_a.img", "img/updated/vendor_a.img")
            if fix_audio:
                Pipeline.replace_audio_device()
            Pipeline.repack_boot()
            Pipeline.pack_super_m88()
            OtherTool.copy_file(Pipeline.ORIGINAL_USER_IMG_PATH, Pipeline.FINAL_USER_IMG_PATH)
            Pipeline.inject_boot_into_user()
            Pipeline.inject_super_into_user()
            Pipeline.print_past_time(start_time)
        finally:
            if is_remove_temps:
                Pipeline.remove_temps()
