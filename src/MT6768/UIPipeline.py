from pathlib import Path

from src.Global import Global
from src.MT6768.Pipeline import Pipeline
from src.MainSystemTool import MainSystemTool
from src.OtherTool import OtherTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI


class UIPipeline:

    def __init__(self, fix_audio, remove_temps, replace_apks, format_ud, extend_ud, installation_type, printc=None):
        if printc is None:
            self.printc = print
        else:
            self.printc = printc
        self.printc("Installation type: " + str(installation_type))
        self.root_path = GlobalUI.firmware_folder
        self.installation_type = installation_type
        self.fix_audio = fix_audio
        self.extend_ud = extend_ud
        self.replace_apks = replace_apks
        self.remove_temps = remove_temps
        self.format_ud = format_ud
        self.original_extracted = self.root_path + "/img/original/extracted"
        self.original_path = self.root_path + "/img/original"
        self.original_d_apk_path = self.original_path + "/d_apk"
        self.original_apk_path = self.original_path + "/apk"
        self.updated_path = self.root_path + "/img/updated"
        self.updated_apk_path = self.updated_path + "/apk"
        self.updated_d_apk_path = self.updated_path + "/d_apk"
        self.replace_path = self.root_path + "/replace"
        self.applauncher = self.replace_path + "/apk/applauncher.apk"

        self.totalcommander = GlobalUI.apps_folder + "/Standard/totalcommander.apk"
        self.NetherSX2 = GlobalUI.apps_folder + "/Standard/NetherSX2.apk"
        self.original_apk_retroarch_path = GlobalUI.apps_folder + "/Standard/RetroArch_ra32.apk"
        self.patched_emu_apk_path = GlobalUI.apps_folder + "/Standard/emu.apk"
        self.patched_n64_apk_path = GlobalUI.apps_folder + "/Standard/n64.apk"

        self.citra = GlobalUI.apps_folder + "/SD/citra.apk"
        self.cpuz = GlobalUI.apps_folder + "/SD/cpuz.apk"
        self.dolphin = GlobalUI.apps_folder + "/SD/dolphin.apk"
        self.aida = GlobalUI.apps_folder + "/SD/aida.apk"
        self.retroarch64 = GlobalUI.apps_folder + "/SD/retroarch64.apk"

        self.original_user_path = "USER.img"
        self.result_user_path = self.root_path + "/result/USER.img"
        self.original_boot_folder_path = self.original_extracted + "/boot"
        self.updated_boot_folder_path = self.updated_path + "/boot"
        self.replace_boot_path = self.replace_path + "/boot"
        self.original_boot_path = self.original_extracted + "/boot_a.img"
        self.updated_boot_path = self.updated_path + "/boot_a.img"
        self.original_super_path = self.original_extracted + "/super.img"
        self.updated_super_path = self.updated_path + "/super.img"
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
        self.apk_tool_path = GlobalUI.apktool
        self.apk_signer_path = GlobalUI.apksigner
        self.keystore = GlobalUI.mykeystore
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
        self.lpunpack = GlobalUI.lpunpack
        self.debugfs = GlobalUI.debugfs
        self.truncate = GlobalUI.truncate
        self.resize2fs = GlobalUI.resize2fs
        self.magiskboot = GlobalUI.magiskboot
        self.lpmake = GlobalUI.lpmake
        Global.set_environment_jdk(GlobalUI.jdk17)

    def __fix_user_data(self, temp_folder):
        userdata_path = temp_folder + "/userdata.img"
        Pipeline.extract_image(self.original_user_path, temp_folder, "userdata", self.printc)
        Pipeline.format_user_data(userdata_path, GlobalUI.mke2fs, self.printc)
        return userdata_path

    def step1(self, message):
        self.printc(message)
        self.format_ud = self.format_ud and not self.extend_ud
        OtherTool.del_folder(self.root_path + "/img", self.printc)
        Pipeline.unpack_user(self.original_user_path, self.original_extracted, self.printc, del_folder=False)

    def step2(self, message):
        self.printc(message)
        Pipeline.unpack_super(self.original_super_path, self.original_super_folder_path, self.lpunpack, self.printc)

    def step3(self, message):
        self.printc(message)
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

    def step4(self, message):
        self.printc(message)
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

    def step5(self, message):
        self.printc(message)
        Pipeline.add_applauncher(self.updated_system_path, self.applauncher, self.debugfs, self.printc)
        Pipeline.add_commander(self.updated_system_path, self.totalcommander, self.debugfs, self.printc)
        Pipeline.patch_keyboard(self.updated_system_path, self.replace_keychars, self.debugfs, self.printc)
        Pipeline.add_retro_arch_config(self.updated_system_path, self.retroarch64_config_path, self.debugfs,
                                       self.printc)
        Pipeline.add_nether(self.updated_system_path, self.NetherSX2, self.debugfs, self.printc)

    def step6(self, message):
        self.printc(message)
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

    def step7(self, message):
        self.printc(message)
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
    def step8(self, message):
        self.printc(message)
        OtherTool.copy_file(self.original_user_path, self.result_user_path, create_folders=True, printc=self.printc)

    def step9(self, message):
        self.printc(message)
        formatted_user_data = None
        if self.format_ud:
            formatted_user_data = self.__fix_user_data(self.root_path + "/img")

        product_a = self.original_super_folder_path + "/product_a.img"
        product_b = self.original_super_folder_path + "/product_b.img"
        system_a = self.updated_system_path
        system_b = self.original_super_folder_path + "/system_b.img"
        vendor_a = self.updated_vendor_path
        vendor_b = self.original_super_folder_path + "/vendor_b.img"
        if self.extend_ud:
            SuperTool.pack_super_m88_standard_size(product_a, product_b, system_a, system_b, vendor_a, vendor_b,
                                                   self.updated_super_path, GlobalUI.lpmake, self.printc)
            Pipeline.extract_image(self.original_user_path, self.updated_path, "userdata", self.printc)
            Pipeline.resize_userdata(self.original_user_path, self.updated_path, GlobalUI.truncate, GlobalUI.mke2fs,
                                     self.printc)
            images_dict = Pipeline.prepare_list_updated_images_to_pack(self.original_user_path, self.format_ud,
                                                                       self.extend_ud, self.original_extracted,
                                                                       self.updated_path, self.printc)
            MainSystemTool.reassemble_user_image_with_paths(self.result_user_path, images_dict, self.printc)
        else:
            SuperTool.pack_super_m88(product_a_path=product_a,
                                     product_b_path=product_b,
                                     system_a_path=system_a,
                                     system_b_path=system_b,
                                     vendor_a_path=vendor_a,
                                     vendor_b_path=vendor_b,
                                     original_super_path=self.original_super_path,
                                     result_super_path=self.updated_super_path,
                                     lpmake=self.lpmake,
                                     printc=self.printc)
            Pipeline.inject_boot_into_user(self.updated_boot_path, self.result_user_path, self.printc)
            Pipeline.inject_super_into_user(self.updated_super_path, self.result_user_path, self.printc)
            if formatted_user_data is not None:
                Pipeline.inject_user_data_into_user(formatted_user_data, self.result_user_path, self.printc)

    def start(self):
        done = False
        def message(num):
            return f"\n========================STEP {num}==========================="
        try:
            self.step1(message(1))
            self.step2(message(2))
            self.step3(message(3))
            self.step4(message(4))
            self.step5(message(5))
            self.step6(message(6))
            self.step7(message(7))
            self.step8(message(8))
            self.step9(message(9))
            done = True
        except Exception as e:
            self.printc(str(e))
        finally:
            if self.remove_temps:
                OtherTool.del_folder(self.root_path + "/img", self.printc)
            if done:
                self.printc("Upgraded USER.img is in", self.result_user_path)
            else:
                OtherTool.del_file(self.result_user_path, self.printc)
        return done
