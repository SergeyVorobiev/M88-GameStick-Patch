import os
from pathlib import Path

from src.MT6768.Pipeline import Pipeline
from src.OtherTool import OtherTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI


class UIPipeline:

    def __init__(self, fix_audio, remove_temps, printc=None):
        self.root_path = GlobalUI.firmware_folder
        self.fix_audio = fix_audio
        self.remove_temps = remove_temps
        self.root_path_exec = self.root_path + "/exec"
        self.original_extracted = self.root_path + "/img/original/extracted"
        self.original_path = self.root_path + "/img/original"
        self.original_d_apk_path = self.original_path + "/d_apk"
        self.original_apk_path = self.original_path + "/apk"
        self.updated_path = self.root_path + "/img/updated"
        self.updated_apk_path = self.updated_path + "/apk"
        self.updated_d_apk_path = self.updated_path + "/d_apk"
        self.replace_path = self.root_path + "/replace"
        self.original_user_path = "USER.img"
        self.result_user_path = self.root_path + "/result/USER.img"
        self.printc = printc
        self.original_boot_folder_path = self.original_extracted + "/boot"
        self.updated_boot_folder_path = self.updated_path + "/boot"
        self.replace_boot_path = self.replace_path + "/boot"
        self.original_boot_path = self.original_extracted + "/23.boot_a.img"
        self.updated_boot_path = self.updated_path + "/23.boot_a.img"
        self.original_super_path = self.original_extracted + "/45.super.img"
        self.updated_super_path = self.updated_path + "/45.super.img"
        self.original_super_folder_path = self.original_extracted + "/super"
        self.original_system_path = self.original_super_folder_path + "/system_a.img"
        self.original_vendor_path = self.original_super_folder_path + "/vendor_a.img"
        self.updated_system_path = self.updated_path + "/system_a.img"
        self.updated_vendor_path = self.updated_path + "/vendor_a.img"
        self.original_system_folder = self.original_super_folder_path + "/system_a"
        self.original_vendor_folder = self.original_super_folder_path + "/vendor_a"
        self.original_d_apk_retroarch_path = self.original_d_apk_path + "/retroarch32"
        self.updated_d_apk_retroarch_path = self.updated_d_apk_path + "/retroarch32"
        self.replace_retroarch_path = self.replace_path + "/retro32"
        self.replace_system_path = self.replace_path + "/system"
        self.original_apk_retroarch_path = self.root_path + "/replace/RetroArch_ra32.apk"
        self.updated_apk_retroarch_path = self.updated_apk_path + '/RetroArch_ra32.apk'
        self.apk_tool_path = self.root_path_exec + "/apktool.jar"
        self.apk_signer_path = self.root_path_exec + "/signer/apksigner.bat"
        self.keystore = self.root_path_exec + "/signer/my.keystore"
        self.original_emu_apk_path = self.original_apk_path + "/emu.apk"
        self.original_emu_d_apk_path = self.original_d_apk_path + "/emu"
        self.updated_emu_apk_path = self.updated_apk_path + "/emu.apk"
        self.updated_emu_d_apk_path = self.updated_d_apk_path + "/emu"
        self.replace_emu_path = self.replace_path + "/emu"
        self.original_n64_apk_path = self.original_apk_path + "/n64.apk"
        self.original_n64_d_apk_path = self.original_d_apk_path + "/n64"
        self.updated_n64_apk_path = self.updated_apk_path + "/n64.apk"
        self.updated_n64_d_apk_path = self.updated_d_apk_path + "/n64"
        self.replace_n64_path = self.replace_path + "/n64"
        self.replace_audio_path = self.replace_path + "/audio"

        self.lpunpack = self.root_path_exec + "/lpunpack.exe"
        self.debugfs = self.root_path_exec + "/debugfs.exe"
        self.truncate = self.root_path_exec + "/truncate.exe"
        self.resize2fs = self.root_path_exec + "/resize2fs.exe"
        self.magiskboot = self.root_path_exec + "/magiskboot.exe"
        self.lpmake = self.root_path_exec + "/lpmake.exe"
        self.java = self.root_path_exec + "/jdk17/bin/java"
        os.environ["JAVA_HOME"] = str(Path(self.root_path_exec + "/jdk17").absolute())
        UIPipeline.set_environment_jdk()

    @staticmethod
    def set_environment_jdk():
        jre = str(Path(GlobalUI.firmware_folder + "exec/jdk17/bin").absolute())
        current_path = os.environ.get("PATH", "")
        if not current_path.startswith(jre):
            new_path = jre + os.pathsep + current_path
            os.environ["PATH"] = new_path

    def start(self):
        done = False
        try:
            OtherTool.del_folder(self.root_path + "/img", self.printc)
            Pipeline.unpack_user(self.original_user_path, self.original_extracted, self.printc, del_folder=False)
            Pipeline.unpack_super(self.original_super_path, self.original_super_folder_path, self.lpunpack, self.printc)
            Pipeline.unpack_system(self.original_system_path, self.original_system_folder, self.debugfs, self.printc)

            OtherTool.copy_file(self.original_system_path, self.updated_system_path, True, self.printc)
            if not Pipeline.is_retro_arch_exists(self.original_system_path, self.debugfs, self.printc):
                Pipeline.resize_system_img("+500M", self.updated_system_path, self.truncate, self.resize2fs, self.printc)
                Pipeline.repack_retro_arch_32(self.original_d_apk_retroarch_path,
                                              self.updated_d_apk_retroarch_path,
                                              self.replace_retroarch_path,
                                              self.replace_system_path,
                                              self.original_apk_retroarch_path,
                                              self.updated_apk_retroarch_path,
                                              self.updated_system_path,
                                              self.apk_tool_path,
                                              str(Path(self.apk_signer_path).absolute()),
                                              self.debugfs,
                                              self.keystore,
                                              self.printc,
                                              self.java)

            Pipeline.repack_emu(self.original_extracted,
                                self.original_emu_apk_path,
                                self.original_emu_d_apk_path,
                                self.updated_emu_apk_path,
                                self.updated_emu_d_apk_path,
                                self.replace_emu_path,
                                self.updated_system_path,
                                self.apk_tool_path,
                                str(Path(self.apk_signer_path).absolute()),
                                self.keystore,
                                self.debugfs,
                                self.printc,
                                self.java)

            Pipeline.repack_n64(self.original_extracted,
                                self.original_n64_apk_path,
                                self.original_n64_d_apk_path,
                                self.updated_n64_apk_path,
                                self.updated_n64_d_apk_path,
                                self.replace_n64_path,
                                self.updated_system_path,
                                self.apk_tool_path,
                                str(Path(self.apk_signer_path).absolute()),
                                self.keystore,
                                self.debugfs,
                                self.printc,
                                self.java)

            Pipeline.unpack_vendor(self.original_vendor_path, self.original_vendor_folder, self.debugfs, self.printc)
            OtherTool.copy_file(self.original_vendor_path, self.updated_vendor_path, printc=self.printc)
            if self.fix_audio:
                Pipeline.replace_audio_device(self.updated_vendor_path, self.replace_audio_path, self.debugfs, self.printc)
            Pipeline.repack_boot(self.magiskboot,
                                 self.original_boot_folder_path,
                                 self.original_boot_path,
                                 self.updated_boot_folder_path,
                                 self.updated_boot_path,
                                 self.replace_boot_path,
                                 self.printc)
            SuperTool.pack_super_m88(product_a_path=self.original_super_folder_path + "/product_a.img",
                                     product_b_path=self.original_super_folder_path + "/product_b.img",
                                     system_a_path=self.updated_system_path,
                                     system_b_path=self.original_super_folder_path + "/system_b.img",
                                     vendor_a_path=self.updated_vendor_path,
                                     vendor_b_path=self.original_super_folder_path + "/vendor_b.img",
                                     original_super_path=self.original_super_path,
                                     result_super_path=self.updated_super_path,
                                     lpmake=self.lpmake,
                                     printc=self.printc)
            OtherTool.copy_file(self.original_user_path, self.result_user_path, create_folders=True, printc=self.printc)
            Pipeline.inject_boot_into_user(self.updated_boot_path, self.result_user_path, self.printc)
            Pipeline.inject_super_into_user(self.updated_super_path, self.result_user_path, self.printc)
            done = True
        finally:
            if self.remove_temps:
                OtherTool.del_folder(self.root_path + "/img", self.printc)
            if done:
                self.printc("Upgraded USER.img is in", self.result_user_path)
