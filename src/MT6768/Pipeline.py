import hashlib
import os
import random
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
        #local_path = "img/original/apk/RetroArch_ra32.apk"
        #default_sha = "0adde7f83a41e815ef2904ed983d94c498212336f75fa7d2a2074b5b0ea3b40f8a28d80ceea59d1b45f1f5b4b49c3ad0c750dcf8395dca5b077c7fcd347c10b8"
        #if os.path.exists(local_path):
        #    sha512 = Pipeline.get_sha512(local_path)
        #    if sha512 != default_sha:
        #        raise Exception("Wrong sha512 for RetroArch:", Path(local_path).absolute(), "delete this one and try again or download it manually.")
        #OtherTool.make_dirs("img/original/apk")
        #url = "https://buildbot.libretro.com/stable/1.22.2/android/RetroArch_ra32.apk"
        #print("Downloading RetroArch:", url, "To:", local_path, "\n if you have problems with connection, please download it manually from here:", url)

        #urllib.request.urlretrieve(url, local_path)
        #if os.path.exists(local_path):
        #    sha512 = Pipeline.get_sha512(local_path)
        #     if sha512 != default_sha:
        #        raise Exception("Wrong sha512 for RetroArch:", Path(local_path).absolute(), "delete this one and try again or download it manually.")
        #print(f"Done")

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
    def inject_system_into_user(system_path="img/updated/system_a.img", super_path="img/updated/super.img", user_path=None):
        if user_path is None:
            user_path = Pipeline.FINAL_USER_IMG_PATH
        offset = SuperTool.get_partition_offset(super_path, "system_a")
        OtherTool.inject(system_path, super_path, offset)
        offset, size = MainSystemTool.find_offset(user_path, "super.img")
        OtherTool.inject(super_path, user_path, offset)

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
    def inject_boot_into_user(updated_boot_path="img/updated/boot_a.img", result_user_path=None, printc=None):
        if result_user_path is None:
            result_user_path = Pipeline.FINAL_USER_IMG_PATH
        offset, size = MainSystemTool.find_offset(result_user_path, "boot_a.img")
        OtherTool.inject(updated_boot_path, result_user_path, offset, printc)

    @staticmethod
    def inject_super_into_user(updated_super_path="img/updated/super.img", result_user_path=None, printc=None):
        if result_user_path is None:
            result_user_path = Pipeline.FINAL_USER_IMG_PATH
        offset, size = MainSystemTool.find_offset(result_user_path, "super.img")
        OtherTool.inject(updated_super_path, result_user_path, offset, printc)

    @staticmethod
    def inject_user_data_into_user(updated_userdata_path="img/updated/userdata.img", result_user_path=None, printc=None):
        if result_user_path is None:
            result_user_path = Pipeline.FINAL_USER_IMG_PATH
        offset, size = MainSystemTool.find_offset(result_user_path, "userdata.img")
        OtherTool.inject(updated_userdata_path, result_user_path, offset, printc)

    @staticmethod
    def inject_meta_data_into_user(updated_userdata_path="img/updated/metadata.img", result_user_path=None,
                                   printc=None):
        if result_user_path is None:
            result_user_path = Pipeline.FINAL_USER_IMG_PATH
        offset, size = MainSystemTool.find_offset(result_user_path, "metadata.img")
        OtherTool.inject(updated_userdata_path, result_user_path, offset, printc)

    @staticmethod
    def pack_boot(magiskboot_path=None, updated_boot_folder_path="img/updated/boot", original_boot_path="img/original/extracted/boot_a.img", updated_boot_path="img/updated/boot_a.img", printc=None):
        magiskboot = MagiskbootTool(magiskboot_path)

        # Pack ramdisk
        magiskboot.pack_ramdisk(updated_boot_folder_path + "/cpio", updated_boot_folder_path + "/ramdisk", updated_boot_folder_path + "/ramdisk.cpio", printc)

        # Pack ramdisk, kernel, dtb to boot
        magiskboot.pack_boot(original_boot_path, updated_boot_folder_path,  updated_boot_path, printc)

    @staticmethod
    def unpack_boot(magiskboot_path=None, original_boot_folder_path="img/original/extracted/boot", original_boot_path="img/original/extracted/boot_a.img", printc=None):
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
    def decompile_original_app(app_name):
        apk_tool = APKTool()
        folder_path = f"img/original/d_apk/{app_name}"
        OtherTool.del_folder(folder_path)
        apk_tool.decompile_into(folder_path, f'img/original/apk/{app_name}.apk')

    @staticmethod
    def delete_n64_from_system_app(system_path="img/updated/system_a.img", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(system_path)

        folders = modify_tool.get_folder_names_contain_part("/system/app", "n64", debugfs, printc)
        for folder in folders:
            n64_folder_path = "/system/app/" + folder
            n64_apk_names = modify_tool.get_apk_names_contain_part(n64_folder_path, "n64", debugfs, printc)
            for n64_apk_name in n64_apk_names:
                n64_apk_path = n64_folder_path + "/" + n64_apk_name
                modify_tool.remove_file(n64_apk_path, True, debugfs, printc)

    @staticmethod
    def compile_and_sign_original_app(app_name):
        apk_tool = APKTool()
        apk_tool.compile_and_sign(f'img/original/d_apk/{app_name}', f'img/updated/apk/{app_name}.apk')

    @staticmethod
    def remove_retro_arch_32(updated_system_path="img/updated/system_a.img", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.remove_file("system/priv-app/RetroArch_ra32/RetroArch_ra32.apk", debugfs=debugfs, printc=printc)
        modify_tool.remove_file('system/priv-app/RetroArch_ra32', is_file=False, debugfs=debugfs, printc=printc)

    @staticmethod
    def sign_original_app(app_name):
        apk_tool = APKTool()
        apk_tool.sign(f'img/original/apk/{app_name}.apk')

    @staticmethod
    def remove_retro_arch_64():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/priv-app/RetroArch_aarch64/RetroArch_aarch64.apk")
        modify_tool.remove_file('system/priv-app/RetroArch_aarch64', is_file=False)

    @staticmethod
    def add_retro_arch_32(updated_system_path="img/updated/system_a.img", updated_apk_path='img/updated/apk/RetroArch_ra32.apk', debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.add_file(updated_apk_path, 'system/priv-app/RetroArch_ra32/RetroArch_ra32.apk', debugfs=debugfs, printc=printc)

    @staticmethod
    def add_retro_arch_config(updated_system_path="img/updated/system_a.img", config_path="replace/retro64/retroarch.cfg", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        path_to_place = 'system/res/retroarch.cfg'
        modify_tool.remove_file(path_to_place, debugfs=debugfs, printc=printc)
        modify_tool.add_file(config_path, path_to_place, True, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_cpuz(updated_system_path="img/updated/system_a.img", updated_apk_path='img/original/apk/cpuz.apk',
                 debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/preinstall/manual/cpuz.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        # modify_tool.remove_file("system/priv-app/cpuz", debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_aida(updated_system_path="img/updated/system_a.img", updated_apk_path='img/original/apk/aida.apk',
                 debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/preinstall/manual/aida.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        # modify_tool.remove_file("system/priv-app/aida", debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_dolphin(updated_system_path="img/updated/system_a.img", updated_apk_path='img/original/apk/dolphin.apk',
                    debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/preinstall/manual/dolphin.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_commander(updated_system_path="img/updated/system_a.img",
                      updated_apk_path='img/original/apk/totalcommander.apk',
                      debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        total_folder = "system/priv-app/totalcommander"
        install_path = total_folder + "/totalcommander.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)

        modify_tool.remove_file(total_folder, debugfs=debugfs, printc=printc)

        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(total_folder, "004", "0755", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(total_folder, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

        modify_tool.set_rights(install_path, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

    @staticmethod
    def add_terminal(updated_system_path="img/updated/system_a.img",
                      updated_apk_path='img/original/apk/terminal.apk',
                      lib_folder="replace/apk/libs/terminal",
                      debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        total_folder = "system/priv-app/terminal"
        s_lib_folder = "system/priv-app/terminal/lib"
        armeabi_folder = "system/priv-app/terminal/lib/arm"
        term_so = "system/priv-app/terminal/lib/arm/libjackpal-androidterm5.so"
        termex_so = "system/priv-app/terminal/lib/arm/libjackpal-termexec2.so"
        install_path = total_folder + "/terminal.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.remove_file(term_so, debugfs=debugfs, printc=printc)
        modify_tool.remove_file(termex_so, debugfs=debugfs, printc=printc)
        modify_tool.remove_file(armeabi_folder, debugfs=debugfs, printc=printc)
        modify_tool.remove_file(s_lib_folder, debugfs=debugfs, printc=printc)
        modify_tool.remove_file(total_folder, debugfs=debugfs, printc=printc)

        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

        modify_tool.add_file(lib_folder + "/libjackpal-androidterm5.so", term_so, debugfs=debugfs, printc=printc)
        modify_tool.add_file(lib_folder + "/libjackpal-termexec2.so", termex_so, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(total_folder, "004", "0755", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(total_folder, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

        modify_tool.set_rights(install_path, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)



        modify_tool.set_rights(s_lib_folder, "004", "0755", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(s_lib_folder, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

        modify_tool.set_rights(armeabi_folder, "004", "0755", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(armeabi_folder, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

        modify_tool.set_rights(term_so, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(term_so, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

        modify_tool.set_rights(termex_so, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(termex_so, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

    @staticmethod
    def add_nether(updated_system_path="img/updated/system_a.img",
                   updated_apk_path='img/original/apk/NetherSX2.apk',
                   debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/app/AetherSX2/AetherSX2.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_citra(updated_system_path="img/updated/system_a.img",
                  updated_apk_path='img/original/apk/citra.apk',
                  debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/preinstall/manual/citra.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_retro_arch_64(updated_system_path="img/updated/system_a.img",
                          updated_apk_path='img/original/apk/retroarch64.apk',
                          debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/preinstall/manual/retroarch64.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_logcat(updated_system_path="img/updated/system_a.img",
                   updated_apk_path='img/original/apk/logc.apk',
                   debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/app/logc/logc.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.remove_file("system/app/logc", debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

    @staticmethod
    def add_applauncher(updated_system_path="img/updated/system_a.img",
                        updated_apk_path='img/original/apk/applauncher.apk',
                        debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        app_folder = "system/priv-app/applauncher"
        install_path = app_folder + "/applauncher.apk"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.remove_file("system/priv-app/applauncher", debugfs=debugfs, printc=printc)
        modify_tool.add_file(updated_apk_path, install_path, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(app_folder, "004", "0755", "0", "0", debugfs, printc)
        modify_tool.set_selinux_context(app_folder, "u:object_r:system_file:s0\\000", debugfs, printc)

        modify_tool.set_rights(install_path, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

    @staticmethod
    def modify_services(updated_system_path="img/updated/system_a.img", services_path="replace/services", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        framework_path = "system/framework"
        def modify(name):
            framework_file_path = framework_path + "/" + name
            replace_file_path = services_path + "/" + name
            modify_tool.remove_file(framework_file_path, debugfs=debugfs, printc=printc)
            modify_tool.add_file(replace_file_path, framework_file_path, debugfs=debugfs, printc=printc)

            modify_tool.set_rights(framework_file_path, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
            modify_tool.set_selinux_context(framework_file_path, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

        services_folder = Path(services_path)
        for item in services_folder.iterdir():
            if item.is_file():
                modify(item.name)

    @staticmethod
    def add_su(updated_system_path="img/updated/system_a.img", su_path="replace/system/su",
                        debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        xbin = "system/xbin"
        install_path = xbin + "/su"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.remove_file(xbin, debugfs=debugfs, printc=printc)
        modify_tool.add_file(su_path, install_path, True, False, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(xbin, "004", "4755", "0", "2000", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(xbin, "u:object_r:system_file:s0\\000", debugfs=debugfs, printc=printc)

        modify_tool.set_rights(install_path, "010", "6755", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path, "u:object_r:su_exec:s0\\000", debugfs=debugfs, printc=printc) #  "u:object_r:system_file:s0\\000"

    @staticmethod
    def replace_debug_sepolicy(updated_system_path="img/updated/system_a.img", pol_path="replace/system/gsi/plat_sepolicy.cil", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/system_ext/etc/selinux/userdebug_plat_sepolicy.cil"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)

        modify_tool.add_file(pol_path, install_path, True, False, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(install_path, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path,
                                        "u:object_r:sepolicy_file:s0\\000", debugfs=debugfs, printc=printc)  # "u:object_r:system_file:s0\\000"

    @staticmethod
    def add_sepolicy(updated_system_path="img/updated/system_a.img", pol_path="replace/system/gsi/plat_sepolicy.cil",
                   debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        install_path = "system/etc/selinux/plat_sepolicy.cil"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(pol_path, install_path, True, False, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(install_path, "010", "0644", "0", "0", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path,
                                        "u:object_r:sepolicy_file:s0\\000", debugfs=debugfs, printc=printc)  # "u:object_r:system_file:s0\\000"

    @staticmethod
    def add_toybox(updated_system_path="img/updated/system_a.img", box_path="replace/system/toybox",
               debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        _bin = "system/bin"
        install_path = _bin + "/toybox"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(box_path, install_path, True, False, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(install_path, "010", "0755", "0", "2000", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path, "u:object_r:toolbox_exec:s0\\000", debugfs=debugfs, printc=printc)  # "u:object_r:system_file:s0\\000"

    @staticmethod
    def add_remount(updated_system_path="img/updated/system_a.img", rem_path="replace/system/remount",
                   debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        _bin = "system/bin"
        install_path = _bin + "/remount"
        modify_tool.remove_file(install_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(rem_path, install_path, True, False, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(install_path, "010", "0755", "0", "2000", debugfs=debugfs, printc=printc)
        modify_tool.set_selinux_context(install_path,
                                        "u:object_r:remount_exec:s0\\000", debugfs=debugfs, printc=printc)  # "u:object_r:system_file:s0\\000"

    @staticmethod
    def patch_keyboard(updated_system_path="img/updated/system_a.img", replace_keychars_path="replace/keychars",
                       debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)

        file_name = "system/usr/keylayout/Vendor_0810_Product_0001.kl"
        modify_tool.remove_file(file_name, debugfs=debugfs, printc=printc)
        modify_tool.add_file(replace_keychars_path + "/Vendor_0810_Product_0001.kl", file_name, True, True, debugfs, printc)

        file_name = "system/usr/keychars/Vendor_0810_Product_0001.kcm"
        modify_tool.remove_file(file_name, debugfs=debugfs, printc=printc)
        modify_tool.add_file(replace_keychars_path + "/Vendor_0810_Product_0001.kcm", file_name, True, True, debugfs, printc)


    @staticmethod
    def patch_privileges(updated_system_path="img/updated/system_a.img", replace_system_path="replace/system", debugfs=None, printc=None):
        modify_tool = Ext4ModifyTool(updated_system_path)
        perm_plat = "system/etc/permissions/privapp-permissions-platform.xml"
        modify_tool.remove_file(perm_plat, debugfs=debugfs, printc=printc)
        modify_tool.add_file(replace_system_path + "/privapp-permissions-platform.xml",
                             perm_plat, True, True, debugfs, printc)
        modify_tool.set_rights(perm_plat, "010", "0644", "0", "0", debugfs, printc)
        modify_tool.set_selinux_context(perm_plat, "u:object_r:system_file:s0\\000", debugfs, printc)

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
    def get_fw_size(fw_size_path="img/original/extracted/super/system_a/system/etc/fw_size"):
        try:
            with open(fw_size_path, 'r', encoding='utf-8') as file:
                return int(file.readline())
        except FileNotFoundError:
            ...
        return 0

    @staticmethod
    def resize_user_data(image_path, new_size, truncate=None, mke2fs=None, printc=None):
        modify_tool = Ext4ModifyTool(image_path)
        modify_tool.truncate_img(new_size, truncate, printc)
        modify_tool.format(mke2fs, printc)

    @staticmethod
    def resize_system_img_conditionally(installation_type, img_ver, system_path="img/updated/system_a.img", updated_folder_path="img/updated", extracted_folder_path="img/original/extracted", truncate=None, resize2fs=None, debugfs=None, printc=None):
        fw_path = extracted_folder_path + "/super/system_a/system/etc/fw_size"
        size = Pipeline.get_fw_size(fw_path)
        if size == 0 and Pipeline.is_retro_arch32_exists(system_path, debugfs, printc):
            size = 500

        if size == 500:
            ... # max size
        elif size == 300 and installation_type == 0:
            Pipeline.resize_system_img('+200MB', system_path, truncate, resize2fs, printc)
            size = 500
        elif size == 100:
            if installation_type == 0:
                Pipeline.resize_system_img('+400MB', system_path, truncate, resize2fs, printc)
                size = 500
            elif installation_type == 1:
                Pipeline.resize_system_img('+200MB', system_path, truncate, resize2fs, printc)
                size = 300
        elif size == 0:
            if installation_type == 0:
                Pipeline.resize_system_img('+500MB', system_path, truncate, resize2fs, printc)
                size = 500
            elif installation_type == 1:
                Pipeline.resize_system_img('+300MB', system_path, truncate, resize2fs, printc)
                size = 300
            elif installation_type == 2:
                Pipeline.resize_system_img('+100MB', system_path, truncate, resize2fs, printc)
                size = 100

        modify_tool = Ext4ModifyTool(system_path)
        path_to_fw_size = "system/etc/fw_size"
        modify_tool.remove_file(path_to_fw_size, True, debugfs, printc)
        new_fw_size_path = updated_folder_path + "/fw_size"
        OtherTool.del_file(new_fw_size_path, printc)
        OtherTool.make_file(new_fw_size_path, printc)
        OtherTool.write_to_file(new_fw_size_path, str(size))
        modify_tool.add_file(new_fw_size_path, path_to_fw_size, True, False, debugfs, printc)

        # add_ver
        path_to_img_ver = "system/etc/img_ver"
        modify_tool.remove_file(path_to_img_ver, True, debugfs, printc)
        new_img_ver_path = updated_folder_path + "/img_ver"
        OtherTool.del_file(new_img_ver_path, printc)
        OtherTool.make_file(new_img_ver_path, printc)
        OtherTool.write_to_file(new_img_ver_path, img_ver)
        modify_tool.add_file(new_img_ver_path, path_to_img_ver, True, False, debugfs, printc)

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
        SuperTool.pack_super_m88(
            #product_a_path="img/updated/product_a.img",
            product_a_path="img/original/extracted/super/product_a.img",
            product_b_path="img/original/extracted/super/product_b.img",
            system_a_path="img/updated/system_a.img",
            system_b_path="img/original/extracted/super/system_b.img",
            vendor_a_path="img/updated/vendor_a.img",
            #vendor_a_path="img/original/extracted/super/vendor_a.img",
            vendor_b_path="img/original/extracted/super/vendor_b.img",
            original_super_path="img/original/extracted/super.img",
            result_super_path="img/updated/super.img"
        )

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
        MainSystemTool.unpack_partitions(user_path, result_folder, "All", printc)

    @staticmethod
    def unpack_super(image_path="img/original/extracted/super.img", result_folder_path="img/original/extracted/super", lpunpack=None, printc=None):

        # Extract super image
        SuperTool.unpack(image_path, result_folder_path, lpunpack, printc)

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
    def unpack_product(what="img/original/extracted/super/product_a.img", where="img/original/extracted/super/product_a",
                      debugfs=None, printc=None):
        Ext4UnpackTool.unpack(what, where, debugfs, printc)

    @staticmethod
    def cure_boot(updated_boot_folder_path="img/updated/boot", original_boot_folder_path="img/original/extracted/boot", replace_boot="replace/boot", printc=None):
        OtherTool.del_folder(updated_boot_folder_path, printc)
        OtherTool.copy_folder(original_boot_folder_path, updated_boot_folder_path, printc)
        fstab1_path = updated_boot_folder_path + "/ramdisk/first_stage_ramdisk/fstab.mt6768"
        fstab2_path = updated_boot_folder_path + "/ramdisk/first_stage_ramdisk/fstab.mt8786"
        #prop_default_path = updated_boot_folder_path + "/ramdisk/prop.default"
        OtherTool.del_file(fstab1_path, printc)
        OtherTool.del_file(fstab2_path, printc)
        #OtherTool.del_file(prop_default_path, printc)
        OtherTool.copy_file(replace_boot + "/fstab.mt6768", fstab1_path, printc=printc)
        OtherTool.copy_file(replace_boot + "/fstab.mt8786", fstab2_path, printc=printc)
        #OtherTool.copy_file(replace_boot + "/prop.default", prop_default_path, printc=printc)

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
        Pipeline.add_retro_arch_32(updated_system_path, updated_apk_path, debugfs, printc)

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
    def replace_lib_engine_ra_strings(path):
        original = b"com.emu/.browser.retroactivity.RetroActivityFuture"
        updated = b"com.ret/.browser.retroactivity.RetroActivityFuture"
        with open(path, "rb") as f:
            data = f.read()

        new_data = data.replace(original, updated)

        with open(path, "wb") as f:
            f.write(new_data)

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
        audio_path = "etc/audio_device.xml"
        mode, context, uid, gid = modify_tool.get_file_meta_data(audio_path, debugfs=debugfs, printc=printc)
        modify_tool.remove_file(audio_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(replace_audio_path + "/vendor/audio_device.xml",
                             audio_path, debugfs=debugfs, printc=printc)
        modify_tool.set_rights(audio_path, '010', mode, uid, gid, debugfs, printc)
        modify_tool.set_selinux_context(audio_path, context, debugfs, printc)

    @staticmethod
    def replace_build_prop(updated_system_path="img/updated/system_a.img", replace_path="replace/system/gsi", debugfs=None, printc=None):
        system_file = "/system/build.prop"
        modify_tool = Ext4ModifyTool(updated_system_path)
        modify_tool.remove_file(system_file, debugfs=debugfs, printc=printc)
        modify_tool.add_file(replace_path + "/build.prop",
                             system_file, debugfs=debugfs, printc=printc)
        modify_tool.set_rights(system_file, "010", "0600", debugfs, printc)
        modify_tool.set_selinux_context(system_file, "u:object_r:system_file:s0\\000", debugfs, printc)

    @staticmethod
    def replace_yaba():
        modify_tool = Ext4ModifyTool("img/updated/system_a.img")
        modify_tool.remove_file("system/preinstall/Yaba.apk")
        modify_tool.add_file("img/updated/apk/Yaba.apk", "system/preinstall/Yaba.apk")

    @staticmethod
    def repack_boot(magiskboot_path=None,
                    original_boot_folder_path="img/original/extracted/boot",
                    original_boot_path="img/original/extracted/boot_a.img",
                    updated_boot_folder_path="img/updated/boot",
                    updated_boot_path="img/updated/boot_a.img",
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
    def remove_vendor_ko_modules(vendor_image_path='img/updated/vendor_a.img', debugfs=None, printc=None):
        tool = Ext4ModifyTool(vendor_image_path)
        tool.remove_folder_with_files("lib/modules", include_root_folder=False, debugfs=debugfs, printc=printc)

    @staticmethod
    def repack_emu(extracted_path="img/original/extracted",
                   original_emu_apk_path="img/original/apk/emu.apk",
                   original_emu_d_apk_path="img/original/d_apk/emu",
                   updated_emu_apk_path='img/updated/apk/emu.apk',
                   updated_emu_d_apk_path="img/updated/d_apk/emu",
                   replace_emu_path="replace/emu",
                   patched_emu_apk_path="replace/apk/emu.apk",
                   updated_system_path="img/updated/system_a.img",
                   replace_only=False,
                   apk_tool_path=None,
                   apk_signer_path=None,
                   keystore=None,
                   debugfs=None,
                   printc=None,
                   java=None):
        if replace_only:
            Pipeline.replace_emu(updated_system_path, patched_emu_apk_path, debugfs, printc)
        else:
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
                   patched_n64_apk_path="replace/apk/n64.apk",
                   updated_system_path="img/updated/system_a.img",
                   replace_only=False,
                   apk_tool_path=None,
                   apk_signer_path=None,
                   keystore=None,
                   debugfs=None,
                   printc=None,
                   java=None):
        if replace_only:
            Pipeline.replace_n64(updated_system_path, patched_n64_apk_path, debugfs, printc)
        else:
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
    def is_retro_arch32_exists(system_path="img/original/extracted/super/system_a.img", debugfs=None, printc=None):
        return Ext4ModifyTool(system_path).check_file_exists("/system/priv-app/RetroArch_ra32/RetroArch_ra32.apk", debugfs, printc)

    @staticmethod
    def sign_original_app_with_platform_key(app_name):
        align = app_name + "_align.apk"
        app = app_name + ".apk"
        apk_tool = APKTool()
        apk_tool.sign_with_pk8('img/original/apk/' + app,
                               'img/original/apk/platform/' + align,
                               'img/original/apk/platform/' + app,
                               'Keys/platform.pk8', 'Keys/platform.x509.pem')
    @staticmethod
    def sign_app_with_platform_key(path, signed_path, align_path=None, printc=None):
        Pipeline.sign_app_with_key(path, signed_path, 'Keys/platform.pk8', 'Keys/platform.x509.pem', align_path=align_path, printc=printc)

    @staticmethod
    def sign_app_with_key(path, signed_path, pk8_path, pem_path, zipalign_path=None, apk_signer_path=None, align_path=None, printc=None, java=None):
        apk_tool = APKTool(apk_signer_path=apk_signer_path, zipalign=zipalign_path, java=java)
        if align_path is not None:
            OtherTool.del_file(align_path, printc)
        OtherTool.del_file(signed_path, printc)
        apk_tool.sign_with_pk8(path, align_path, signed_path, pk8_path, pem_path, printc)

    @staticmethod
    def get_signature_data(path, apk_signer_path=None):
        apk_tool = APKTool(apk_signer_path=apk_signer_path)

        # noinspection PyUnusedLocal
        def print_empty(*messages):
            ...

        def handle(result):
            if result is None:
                return None, None
            message = result.stdout
            dn = None
            sha = None
            try:
                for line in message.split("\n"):
                    if line.__contains__("DN:"):
                        dn = line.split("DN: ")[1]
                    if line.__contains__("certificate SHA-256"):
                        sha = line.split("digest: ")[1]
                return dn, sha
            except Exception as e:
                raise e
        res = apk_tool.verify_signature(path, printc=print_empty)

        return handle(res)



    @staticmethod
    def get_framework_res_key(system_folder_path, apk_signer_path=None):
        system_folder_path = system_folder_path + "/system/framework/framework-res.apk"
        dn, sh = Pipeline.get_signature_data(system_folder_path, apk_signer_path=apk_signer_path)
        return dn, sh

    @staticmethod
    def change_apk_signatures(image_path, path, pk8_path, pem_path, target_sh=None, apk_signer_path=None, debugfs=None, printc=None):
        root_dir = Path(path)
        if printc is None:
            printc = print
        path_on_disk = os.path.normpath(path)
        tool = Ext4ModifyTool(image_path)
        for item in root_dir.rglob('*'):
            # noinspection PyBroadException
            try:
                if item.is_file():
                    if item.name.endswith(".apk"):
                        dn, sh = Pipeline.get_signature_data(str(item), apk_signer_path)
                        printc("Check:", str(item).split(str(root_dir))[1][1:], dn, sh)
                        if target_sh is not None and target_sh != sh:
                            continue
                        path_on_image = str(item).split(path_on_disk)[1]
                        mode, context, uid, gid = tool.get_file_meta_data(path_on_image, debugfs, printc)
                        if mode is None or context is None or uid == -1 or gid == -1:
                            printc(f"Rights fail detected: Mode: {mode}, Context: {context}, uid: {uid}, gid: {gid}")
                            if mode is None:
                                mode = '0644'
                            if context is None:
                                context = "u:object_r:system_file:s0\\000"
                            if uid == -1:
                                uid = '0'
                            if gid == -1:
                                gid = '0'
                        printc(f"Fix: {item} {mode} {context} {uid} {gid} {dn} {sh}")
                        Pipeline.sign_and_send_to_image(str(item), path_on_image, image_path, pk8_path, pem_path, mode,
                                                        uid, gid, context, None, apk_signer_path, debugfs, printc, None)
            except Exception as e:
                if item.name.endswith(".apk"):
                    printc(f"Exception: {item} {str(e)}")

    @staticmethod
    def sign_and_send_to_image(apk_path, path_on_image, image_path, pk8_path, pem_path, mode, uid, gid, context, zipalign_path=None, apk_signer_path=None, debugfs=None, printc=None, java=None):
        apk_signed_path = apk_path[:-4] + "_signed.apk"
        # apk_align_path = apk_path[:-4] + "_align.apk"
        idsig = apk_signed_path + ".idsig"
        try:
            Pipeline.sign_app_with_key(apk_path, apk_signed_path, pk8_path, pem_path, zipalign_path=zipalign_path, apk_signer_path=apk_signer_path, align_path=None, printc=printc, java=java)
            Pipeline.replace_file_in_image(apk_signed_path, path_on_image, image_path, mode, uid, gid, context, debugfs,
                                           printc)
        finally:
            # OtherTool.del_file(apk_align_path)
            OtherTool.del_file(apk_signed_path, printc)
            OtherTool.del_file(idsig, printc)

    @staticmethod
    def replace_file_in_image(file_path, file_in_image_path, image_path, mode, uid, gid, context, debugfs=None, printc=None):
        file_path = file_path.replace("\\", "/")
        file_in_image_path = file_in_image_path.replace("\\", "/")
        modify_tool = Ext4ModifyTool(image_path)
        modify_tool.remove_file(file_in_image_path, debugfs=debugfs, printc=printc)
        modify_tool.add_file(file_path, file_in_image_path, True, False, debugfs=debugfs, printc=printc)

        modify_tool.set_rights(file_in_image_path, "010", mode, uid, gid, debugfs, printc)
        modify_tool.set_selinux_context(file_in_image_path, context, debugfs, printc)

    @staticmethod
    def build_android_gsi():
        #Pipeline.sign_original_app_with_platform_key("SystemUI")
        tool = Ext4ModifyTool('img/updated/vendor_a.img')
        tool.remove_folder_with_files("lib/modules", include_root_folder=False)

    # image_name like - super.img
    @staticmethod
    def inject_image_into_user(image_path, image_name, user_image_path=None, printc=None):
        if user_image_path is None:
            result_user_path = Pipeline.FINAL_USER_IMG_PATH
        else:
            result_user_path = user_image_path
        offset, size = MainSystemTool.find_offset(result_user_path, image_name)
        actual_size = os.path.getsize(image_path)
        if actual_size != size:
            if printc is None:
                printc = print
            printc(f"Can't inject {image_path} into {result_user_path}, expected size: {size} but actual: {actual_size}")
        OtherTool.inject(image_path, result_user_path, offset, printc)

    # partition_name (no number, no extension) like "super"
    @staticmethod
    def extract_image(user_image_path, extract_folder, partition_name, printc=None):
        MainSystemTool.unpack_partitions(user_image_path, extract_folder, partition_name, printc)
        return extract_folder + os.sep + partition_name + ".img"

    # images = [system_a.img, product_a.img, ...]
    @staticmethod
    def extract_super_images(images, user_image_path, result_folder_path, lpunpack=None, printc=None):
        temp_folder = None
        try:
            temp_folder = Pipeline.make_random_temp_folder_inside(result_folder_path, "super")
            Pipeline.extract_image(user_image_path, temp_folder, "super", printc)
            super_img_path = f"{temp_folder}{os.sep}super.img"
            Pipeline.unpack_super(super_img_path, temp_folder, lpunpack, printc)
            for image in images:
                OtherTool.move_file(temp_folder + os.sep + image, result_folder_path, printc)
        finally:
            OtherTool.del_folder(temp_folder, printc)

    @staticmethod
    def make_random_temp_folder_inside(path=None, prefix_name="temp"):
        temp_folder = Pipeline.find_free_random_folder_name(path, prefix_name)
        OtherTool.make_dirs(temp_folder)
        return temp_folder

    @staticmethod
    def find_free_random_folder_name(path=None, prefix_name="temp"):
        attempt = 0
        while attempt < 100000:
            attempt += 1
            if path is None or len(path) == 0:
                temp_folder = prefix_name + str(random.randint(100000000, 999999999))
            else:
                temp_folder = path + "/" + prefix_name + str(random.randint(100000000, 999999999))
            if not os.path.exists(temp_folder):
                return temp_folder
        raise Exception(f"Can't find free random folder name in {path}")

    @staticmethod
    def format_user_data(user_data_image_path='img/updated/userdata.img', mke2fs=None, printc=None):
        modify_tool = Ext4ModifyTool(user_data_image_path)
        modify_tool.format(mke2fs, printc)

    # image_names_dir like - {"product_a": "path/product_a.img"}
    @staticmethod
    def inject_s_image_into_user(image_names_dir, user_image_path="img/result/USER.img", work_folder="", lpunpack=None, lpmake=None, printc=None):
        temp_folder = None
        try:
            temp_folder = Pipeline.make_random_temp_folder_inside(work_folder)
            OtherTool.make_dirs(temp_folder)
            Pipeline.extract_image(user_image_path, temp_folder, "super", printc)
            super_img_path = f"{temp_folder}{os.sep}super.img"
            updated_super_img_path = f"{temp_folder}{os.sep}updated_super.img"
            Pipeline.unpack_super(super_img_path, temp_folder, lpunpack, printc)
            result = {}
            def add_path(name):
                if image_names_dir.get(name):
                    result[name] = image_names_dir[name]
                else:
                    result[name] = temp_folder + os.sep + f"{name}.img"
            add_path("product_a")
            add_path("product_b")
            add_path("system_a")
            add_path("system_b")
            add_path("vendor_a")
            add_path("vendor_b")
            SuperTool.pack_super_m88(
                product_a_path=result["product_a"],
                product_b_path=result["product_b"],
                system_a_path=result["system_a"],
                system_b_path=result["system_b"],
                vendor_a_path=result["vendor_a"],
                vendor_b_path=result["vendor_b"],
                original_super_path=super_img_path,
                result_super_path=updated_super_img_path,
                lpmake=lpmake,
                printc=printc,
            )
            Pipeline.inject_image_into_user(updated_super_img_path, "super.img", user_image_path, printc)
        finally:
            OtherTool.del_folder(temp_folder, printc)

    @staticmethod
    def sign_framework(user_image_path="img/result/USER.img", work_folder_path="img/updated", pk8_path="keys/platform.pk8", pem_path="keys/platform.x509.pem", apk_signer_path=None, debugfs=None, lpunpack=None, lpmake=None, printc=None):
        temp_folder = Pipeline.make_random_temp_folder_inside(work_folder_path)
        if printc is None:
            printc = print
        super_path = Pipeline.extract_image(user_image_path, temp_folder, "super", printc)
        Pipeline.unpack_super(super_path, temp_folder, lpunpack, printc)
        OtherTool.del_file(super_path, printc)
        img_files = ["system_a.img", "system_b.img", "vendor_a.img", "vendor_b.img", "product_a.img", "product_b.img"]
        sh = None
        images_dict = {}
        try:
            for img_file in img_files:
                img_path = temp_folder + os.sep + img_file
                img_folder_path = temp_folder + os.sep + img_file[:-4]
                Ext4UnpackTool.unpack(img_path, img_folder_path, debugfs, printc)
                full_apk_signer_path = Path(apk_signer_path).resolve()
                if sh is None:
                    dn, sh = Pipeline.get_framework_res_key(img_folder_path, full_apk_signer_path)
                    printc("Original:", dn, sh)
                Pipeline.change_apk_signatures(img_path, img_folder_path, pk8_path, pem_path, sh, full_apk_signer_path, debugfs, printc)
                images_dict[img_file[:-4]] = img_path
            Pipeline.inject_s_image_into_user(images_dict, user_image_path, temp_folder, lpunpack, lpmake, printc)
        finally:
            OtherTool.del_folder(temp_folder, printc)

    # In dev
    @staticmethod
    def build_android():
        #Pipeline.inject_boot_into_user()
        #Pipeline.inject_user_data_into_user()
        #Pipeline.pack_super_m88()
        #Pipeline.inject_super_into_user()
        #dn, sh = Pipeline.get_framework_res_key("img/original/system_ao")
        #print(sh, dn)
        #Pipeline.change_apk_signatures("img/updated/system_old.img", "img/original/system_ao/system", "system", sh)
        #Pipeline.change_apk_signatures("img/updated/product_a.img", "img/original/extracted/super/product_a", "", sh)
        #Pipeline.change_apk_signatures("img/updated/vendor_a.img", "img/original/extracted/super/vendor_a", "", sh)

        #Pipeline.pack_super_m88()
        #Pipeline.inject_super_into_user()
        #Pipeline.inject_boot_into_user()

        #Pipeline.sign_original_app_with_platform_key('TermEmu')
        #apk_tool = APKTool()
        #apk_tool.verify_signature(f'img/updated/framework-res.apk')
        #apk_tool = APKTool()
        #modify_tool = Ext4ModifyTool("img/updated/system_a.img")

        #result = modify_tool.get_stat("system/etc/selinux/plat_sepolicy.cil")
        #exit(0)
        # Pipeline.inject_user_data_into_user()
        # OtherTool.copy_file(Pipeline.ORIGINAL_USER_IMG_PATH, Pipeline.FINAL_USER_IMG_PATH)
        #Pipeline.repack_boot()
        #Pipeline.inject_boot_into_user()
        #Pipeline.resize_system_img('+100MB')
        #Pipeline.replace_build_prop()
        #Pipeline.add_su()
        #Pipeline.modify_services()
        #Pipeline.add_toybox()
        #Pipeline.add_remount()
        #Pipeline.replace_debug_sepolicy()
        #Pipeline.add_sepolicy()
        #Pipeline.patch_privileges(replace_system_path='replace/system/gsi')
        #Pipeline.add_applauncher()
        #Pipeline.add_commander()
        #Pipeline.add_terminal()
        #Pipeline.pack_super_m88()
        #Pipeline.inject_super_into_user()
        ...

    @staticmethod
    def repack_user(fix_audio, replace_emu_apk=False, replace_n64_apk=False, is_remove_temps=True, format_ud=False, extend_ud=False, installation_type=0):
        start_time = time.perf_counter()
        super_folder = "img/original/extracted/super/"
        try:
            not_standard_size = not MainSystemTool.check_image_has_size(Pipeline.ORIGINAL_USER_IMG_PATH, "super",
                                                                SuperTool.STANDARD_SUPER_SIZE)
            extend_ud = extend_ud and not_standard_size
            format_ud = format_ud and not extend_ud
            Pipeline.check_original_result_path_different()
            Pipeline.unpack_user()
            Pipeline.unpack_super()
            Pipeline.unpack_system()
            Pipeline.unpack_vendor()
            Pipeline.unpack_product()
            OtherTool.copy_file(super_folder + "system_a.img", "img/updated/system_a.img", True)

            Pipeline.resize_system_img_conditionally(installation_type, "2.3")
            Pipeline.patch_privileges()
            Pipeline.delete_n64_from_system_app()
            Pipeline.repack_n64(replace_only=replace_n64_apk)
            Pipeline.add_applauncher()
            Pipeline.add_commander()
            Pipeline.patch_keyboard()
            Pipeline.add_retro_arch_config()
            Pipeline.add_nether()
            if installation_type != 2:
                Pipeline.repack_emu(replace_only=replace_emu_apk)

                if not Pipeline.is_retro_arch32_exists():
                    Pipeline.download_retro_arch_32_1222()
                    Pipeline.repack_retro_arch_32()

            if installation_type == 0:
                Pipeline.add_aida()
                Pipeline.add_cpuz()
                Pipeline.add_citra()
                Pipeline.add_dolphin()
                Pipeline.add_retro_arch_64()

            Pipeline.unpack_vendor()
            OtherTool.copy_file(super_folder + "vendor_a.img", "img/updated/vendor_a.img")
            if fix_audio:
                Pipeline.replace_audio_device()
            Pipeline.repack_boot()
            OtherTool.copy_file(Pipeline.ORIGINAL_USER_IMG_PATH, Pipeline.FINAL_USER_IMG_PATH)
            formatted_user_data = None
            if format_ud:
                formatted_user_data = "img/updated/userdata.img"
                Pipeline.extract_image(Pipeline.ORIGINAL_USER_IMG_PATH, "img/updated", "userdata")
                Pipeline.format_user_data(formatted_user_data)

            if extend_ud:
                product_a = super_folder + "product_a.img"
                product_b = super_folder + "product_b.img"
                system_a = "img/updated/system_a.img"
                system_b = super_folder + "system_b.img"
                vendor_a = "img/updated/vendor_a.img"
                vendor_b = super_folder + "vendor_b.img"
                SuperTool.pack_super_m88_standard_size(product_a, product_b, system_a, system_b, vendor_a, vendor_b, "img/updated/super.img")
                Pipeline.extract_image(Pipeline.ORIGINAL_USER_IMG_PATH, "img/updated", "userdata")
                Pipeline.resize_userdata()
                images_dict = Pipeline.prepare_list_updated_images_to_pack(Pipeline.FINAL_USER_IMG_PATH, format_ud, extend_ud)
                MainSystemTool.reassemble_user_image_with_paths(Pipeline.FINAL_USER_IMG_PATH, images_dict)
            else:
                Pipeline.pack_super_m88()
                Pipeline.inject_boot_into_user()
                Pipeline.inject_super_into_user()
                if formatted_user_data is not None:
                    Pipeline.inject_user_data_into_user(formatted_user_data)
        finally:
            if is_remove_temps:
                Pipeline.remove_temps()
            Pipeline.print_past_time(start_time)

    @staticmethod
    def prepare_list_updated_images_to_pack(img_path, ud_formatted, ud_extended, original_img_folder="img/original/extracted", updated_img_folder="img/updated", printc=None):
        if img_path is None:
            img_path = Pipeline.ORIGINAL_USER_IMG_PATH
        if printc is None:
            printc = print
        images_list = MainSystemTool.get_image_list(img_path, printc)
        names = ["boot_a.img", "userdata.img", "super.img"]
        images_dict = {}
        for item in images_list:
            name = item[0]
            if names.__contains__(name):
                if name == "userdata.img" and not ud_formatted and not ud_extended:
                    cur_path = original_img_folder + os.sep + name
                else:
                    cur_path = updated_img_folder + os.sep + name
            else:
                cur_path = original_img_folder + os.sep + name
            images_dict[name[:-4]] = cur_path
            printc("Image path to pack:", cur_path)
        return images_dict

    @staticmethod
    def resize_userdata(user_img_path=None, result_folder="img/updated", truncate=None, mke2fs=None, printc=None):
        if user_img_path is None:
            user_img_path = Pipeline.ORIGINAL_USER_IMG_PATH
        if printc is None:
            printc = print
        min_size = 1024 * 1024 * 200
        result = MainSystemTool.calculate_partition_size(user_img_path, {"super": SuperTool.STANDARD_SUPER_SIZE},
                                                         "userdata")
        if result < min_size:
            raise Exception("User data is too small, can't shrink super image.")
        printc("New super image size:", SuperTool.STANDARD_SUPER_SIZE)
        printc("New user data image size:", result, "\n")
        new_path = result_folder + os.sep + "userdata.img"
        Pipeline.resize_user_data(new_path, str(result), truncate, mke2fs, printc)
        return new_path
