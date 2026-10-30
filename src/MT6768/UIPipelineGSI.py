import os

from src.Global import Global
from src.MT6768.Pipeline import Pipeline
from src.MainSystemTool import MainSystemTool
from src.OtherTool import OtherTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI


class UIPipelineGSI:

    def __init__(self, fix_audio, fix_kernel, format_user_data, fix_keychars, extend_user_data, printc=None):
        if printc is None:
            self.printc = print
        else:
            self.printc = printc
        self.fix_audio = fix_audio
        self.fix_kernel = fix_kernel
        self.extend_user_data = extend_user_data
        self.format_user_data = format_user_data
        self.fix_keychars = fix_keychars

        self.root_path = GlobalUI.firmware_folder
        self.replace_path = self.root_path + "/replace"
        self.replace_boot_path = self.replace_path + "/boot"
        self.replace_audio_path = self.replace_path + "/audio"
        self.replace_keychars_path = self.replace_path + "/keychars"
        self.original_user_path = GlobalUI.user_file
        self.result_user_path = self.root_path + "/gsi/USER.img"
        Global.set_environment_jdk(GlobalUI.jdk17)

    def __fix_vendor(self, temp_folder):
        if not self.fix_audio and not self.fix_kernel:
            return None
        vendor_name = "vendor_a.img"
        vendor_path = temp_folder + "/" + vendor_name
        Pipeline.extract_super_images([vendor_name], self.original_user_path, temp_folder, GlobalUI.lpunpack, self.printc)
        if self.fix_audio:
            Pipeline.replace_audio_device(vendor_path, self.replace_audio_path, GlobalUI.debugfs, self.printc)
        if self.fix_kernel:
            Pipeline.remove_vendor_ko_modules(vendor_path, GlobalUI.debugfs, self.printc)
        return vendor_path

    def __fix_boot(self, temp_folder):
        boot_temp_folder = None
        try:
            boot_temp_folder = Pipeline.make_random_temp_folder_inside(temp_folder, "boot")
            original_boot_path = boot_temp_folder + "/boot_a.img"
            boot_folder = boot_temp_folder + "/boot"
            updated_boot_folder = boot_temp_folder + "/updated_boot"
            updated_boot_path = temp_folder + "/boot_a.img"
            Pipeline.extract_image(self.original_user_path, boot_temp_folder, "boot_a", self.printc)
            Pipeline.unpack_boot(GlobalUI.magiskboot, boot_folder, original_boot_path, self.printc)
            Pipeline.cure_boot(updated_boot_folder, boot_folder, self.replace_boot_path, self.printc)
            if self.fix_kernel:
                ...
                # Pipeline.replace_boot_kernel()

            Pipeline.pack_boot(GlobalUI.magiskboot, updated_boot_folder, original_boot_path, updated_boot_path, self.printc)
            return updated_boot_path
        finally:
            OtherTool.del_folder(boot_temp_folder, self.printc)

    def __fix_system(self, temp_folder):
        system_file_path = temp_folder + "/system_a.img"
        OtherTool.copy_file("system_a.img", system_file_path, printc=self.printc)
        if self.fix_keychars:
            Pipeline.patch_keyboard(system_file_path, self.replace_keychars_path, GlobalUI.debugfs, self.printc)
        # Pipeline.patch_privileges(self.updated_system_path, self.replace_system_path, self.debugfs, self.printc)
        return system_file_path

    def __fix_user_data(self, temp_folder):
        userdata_path = temp_folder + "/userdata.img"
        Pipeline.extract_image(self.original_user_path, temp_folder, "userdata", self.printc)
        Pipeline.format_user_data(userdata_path, GlobalUI.mke2fs, self.printc)
        return userdata_path

    def start(self):
        done = False
        temp_folder = None
        try:
            temp_folder = Pipeline.make_random_temp_folder_inside()
            updated_boot_path = self.__fix_boot(temp_folder)
            updated_vendor_path = self.__fix_vendor(temp_folder)
            updated_system_path = self.__fix_system(temp_folder)
            images = {"system_a": updated_system_path}
            if updated_vendor_path is not None:
                images["vendor_a"] = updated_vendor_path
            OtherTool.del_file(self.result_user_path, self.printc)
            OtherTool.copy_file(self.original_user_path, self.result_user_path, True, printc=self.printc)
            if not self.extend_user_data:

                Pipeline.inject_s_image_into_user(images, self.result_user_path, temp_folder, GlobalUI.lpunpack, GlobalUI.lpmake, self.printc)
                Pipeline.inject_boot_into_user(updated_boot_path, self.result_user_path, self.printc)
                if self.format_user_data:
                    updated_user_data_path = self.__fix_user_data(temp_folder)
                    Pipeline.inject_user_data_into_user(updated_user_data_path, self.result_user_path, self.printc)
            else:
                self.__assemble_user_image(temp_folder, updated_vendor_path, updated_system_path, updated_boot_path)
            done = True
        except Exception as e:
            self.printc(str(e))
        finally:
            OtherTool.del_folder(temp_folder, self.printc)
            if done:
                self.printc("Upgraded USER.img is in", self.result_user_path)
            else:
                OtherTool.del_file(self.result_user_path, self.printc)
        return done

    def __assemble_user_image(self, temp_folder, vendor_path, system_path, boot_path):
        user_temp = Pipeline.make_random_temp_folder_inside(temp_folder, "user")

        Pipeline.unpack_user(GlobalUI.user_file, user_temp, self.printc)
        super_path = user_temp + os.sep + "super.img"
        super_temp = Pipeline.make_random_temp_folder_inside(user_temp, "super")
        Pipeline.unpack_super(super_path, super_temp, GlobalUI.lpunpack, self.printc)
        OtherTool.move_file_with_update(vendor_path, super_temp, self.printc)
        OtherTool.move_file_with_update(system_path, super_temp, self.printc)
        OtherTool.move_file_with_update(boot_path, user_temp, self.printc)
        super_image_path = user_temp + os.sep + "super.img"
        SuperTool.pack_super_from_folder(super_temp, super_image_path, GlobalUI.lpmake, self.printc)
        OtherTool.del_folder(super_temp, self.printc)
        new_userdata = Pipeline.resize_userdata(GlobalUI.user_file, temp_folder, GlobalUI.truncate, GlobalUI.mke2fs, self.printc)
        userdata_path = user_temp + os.sep + "userdata.img"
        OtherTool.move_file_with_update(new_userdata, userdata_path, self.printc)
        MainSystemTool.reassemble_user_image(self.result_user_path, user_temp, self.printc)
