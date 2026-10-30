import os

from src.MT6768.Pipeline import Pipeline
from src.MainSystemTool import MainSystemTool
from src.OtherTool import OtherTool
from src.SuperTool import SuperTool
from src.db.UI.GlobalUI import GlobalUI


class UIPipelineExtendUD:

    def __init__(self, printc=None):
        if printc is None:
            self.printc = print
        else:
            self.printc = printc

    def start(self):
        temp_folder = None
        min_size = 1024 * 1024 * 200
        try:
            temp_folder = Pipeline.make_random_temp_folder_inside()
            MainSystemTool.unpack_partitions(GlobalUI.user_file, temp_folder, printc=self.printc)
            result = MainSystemTool.calculate_partition_size(GlobalUI.user_file, {"super": SuperTool.STANDARD_SUPER_SIZE},
                                                             "userdata")
            if result < min_size:
                raise Exception("User data is too small, can't shrink super image.")
            self.printc("New super image size:", SuperTool.STANDARD_SUPER_SIZE)
            self.printc("New user data image size:", result, "\n")
            super_image_path = temp_folder + os.sep + "super.img"
            Pipeline.resize_user_data(temp_folder + os.sep + "userdata.img", str(result), GlobalUI.truncate, GlobalUI.mke2fs, self.printc)
            new_folder = Pipeline.make_random_temp_folder_inside(temp_folder)
            Pipeline.unpack_super(super_image_path, new_folder, GlobalUI.lpunpack, self.printc)
            SuperTool.pack_super_from_folder(new_folder, super_image_path, GlobalUI.lpmake, self.printc)
            MainSystemTool.reassemble_user_image(GlobalUI.user_file, temp_folder, self.printc)
            return True
        finally:
            OtherTool.del_folder(temp_folder)