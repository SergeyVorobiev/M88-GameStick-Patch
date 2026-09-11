from pathlib import Path

from src.Global import Global
from src.MT6768.Pipeline import Pipeline
from src.OtherTool import OtherTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI


class UIPipeline:

    def __init__(self, fix_audio, remove_temps, replace_apks, installation_type, printc=None):
        if printc is not None:
            printc("Installation type: " + str(installation_type))
        self.root_path = GlobalUI.firmware_folder
        self.installation_type = installation_type
        self.fix_audio = fix_audio
        self.replace_apks = replace_apks
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

        self.applauncher = self.replace_path + "/apk/applauncher.apk"
        self.totalcommander = self.replace_path + "/apk/totalcommander.apk"
        self.NetherSX2 = self.replace_path + "/apk/NetherSX2.apk"
        self.original_apk_retroarch_path = self.replace_path + "/apk/RetroArch_ra32.apk"
        self.patched_emu_apk_path = self.replace_path + "/apk/emu.apk"
        self.patched_n64_apk_path = self.replace_path + "/apk/n64.apk"

        self.citra = self.replace_path + "/Apps/citra.apk"
        self.cpuz = self.replace_path + "/Apps/cpuz.apk"
        self.dolphin = self.replace_path + "/Apps/dolphin.apk"
        self.aida = self.replace_path + "/Apps/aida.apk"
        self.retroarch64 = self.replace_path + "/Apps/retroarch64.apk"

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
        self.replace_keychars = self.replace_path + "/keychars"
        self.retroarch64_config_path = self.replace_path + "/retro64/retroarch.cfg"
        self.lpunpack = self.root_path_exec + "/lpunpack.exe"
        self.debugfs = self.root_path_exec + "/debugfs.exe"
        self.truncate = self.root_path_exec + "/truncate.exe"
        self.resize2fs = self.root_path_exec + "/resize2fs.exe"
        self.magiskboot = self.root_path_exec + "/magiskboot.exe"
        self.lpmake = self.root_path_exec + "/lpmake.exe"
        Global.set_environment_jdk(self.root_path_exec + "/jdk17")

    def start(self):
        done = False
        try:
            OtherTool.del_folder(self.root_path + "/img", self.printc)
            Pipeline.unpack_user(self.original_user_path, self.original_extracted, self.printc, del_folder=False)
            Pipeline.unpack_super(self.original_super_path, self.original_super_folder_path, self.lpunpack, self.printc)
            Pipeline.unpack_system(self.original_system_path, self.original_system_folder, self.debugfs, self.printc)

            OtherTool.copy_file(self.original_system_path, self.updated_system_path, True, self.printc)
            Pipeline.resize_system_img_conditionally(self.installation_type,
                                                     GlobalUI.img_ver,
                                                     self.updated_system_path,
                                                     self.updated_path,
                                                     self.original_extracted,
                                                     self.truncate,
                                                     self.resize2fs,
                                                     self.debugfs,
                                                     self.printc)

            Pipeline.patch_privileges(self.updated_system_path, self.replace_system_path, self.debugfs, self.printc)
            Pipeline.delete_n64_from_system_app(self.updated_system_path, self.debugfs, self.printc)

            Pipeline.repack_n64(self.original_extracted,
                                self.original_n64_apk_path,
                                self.original_n64_d_apk_path,
                                self.updated_n64_apk_path,
                                self.updated_n64_d_apk_path,
                                self.replace_n64_path,
                                self.patched_n64_apk_path,
                                self.updated_system_path,
                                True,
                                self.apk_tool_path,
                                str(Path(self.apk_signer_path).absolute()),
                                self.keystore,
                                self.debugfs,
                                self.printc,
                                None)

            Pipeline.add_applauncher(self.updated_system_path, self.applauncher, self.debugfs, self.printc)
            Pipeline.add_commander(self.updated_system_path, self.totalcommander, self.debugfs, self.printc)
            Pipeline.patch_keyboard(self.updated_system_path, self.replace_keychars, self.debugfs, self.printc)
            Pipeline.add_retro_arch_config(self.updated_system_path, self.retroarch64_config_path, self.debugfs,
                                           self.printc)
            Pipeline.add_nether(self.updated_system_path, self.NetherSX2, self.debugfs, self.printc)

            if self.installation_type != 2:
                Pipeline.repack_emu(self.original_extracted,
                                    self.original_emu_apk_path,
                                    self.original_emu_d_apk_path,
                                    self.updated_emu_apk_path,
                                    self.updated_emu_d_apk_path,
                                    self.replace_emu_path,
                                    self.patched_emu_apk_path,
                                    self.updated_system_path,
                                    self.replace_apks,
                                    self.apk_tool_path,
                                    str(Path(self.apk_signer_path).absolute()),
                                    self.keystore,
                                    self.debugfs,
                                    self.printc,
                                    None)

                if not Pipeline.is_retro_arch32_exists(self.original_system_path, self.debugfs, self.printc):
                    Pipeline.repack_retro_arch_32(self.original_d_apk_retroarch_path,
                                                  self.updated_d_apk_retroarch_path,
                                                  self.replace_retroarch_path,
                                                  self.original_apk_retroarch_path,
                                                  self.updated_apk_retroarch_path,
                                                  self.updated_system_path,
                                                  self.apk_tool_path,
                                                  str(Path(self.apk_signer_path).absolute()),
                                                  self.debugfs,
                                                  self.keystore,
                                                  self.printc,
                                                  None)
            if self.installation_type == 0:
                Pipeline.add_aida(self.updated_system_path, self.aida, self.debugfs, self.printc)
                Pipeline.add_cpuz(self.updated_system_path, self.cpuz, self.debugfs, self.printc)
                Pipeline.add_citra(self.updated_system_path, self.citra, self.debugfs, self.printc)
                Pipeline.add_dolphin(self.updated_system_path, self.dolphin, self.debugfs, self.printc)
                Pipeline.add_retro_arch_64(self.updated_system_path, self.retroarch64, self.debugfs, self.printc)

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
        except Exception as e:
            self.printc(str(e))
        finally:
            if self.remove_temps:
                OtherTool.del_folder(self.root_path + "/img", self.printc)
            if done:
                self.printc("Upgraded USER.img is in", self.result_user_path)
        return done
