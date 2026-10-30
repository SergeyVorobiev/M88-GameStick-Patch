from src.Global import Global
from src.MT6768.Pipeline import Pipeline
from src.db.UI.GlobalUI import GlobalUI


class UIPipelineSign:

    def __init__(self, pk8_path, pem_path, printc=None):
        if printc is None:
            self.printc = print
        else:
            self.printc = printc
        self.pk8_path = pk8_path
        self.pem_path = pem_path
        self.root_path = GlobalUI.firmware_folder
        Global.set_environment_jdk(GlobalUI.jdk17)

    def start(self):
        Pipeline.sign_framework(GlobalUI.user_file,
                                "",
                                self.pk8_path,
                                self.pem_path,
                                GlobalUI.apksigner,
                                GlobalUI.debugfs,
                                GlobalUI.lpunpack,
                                GlobalUI.lpmake,
                                self.printc)
        return True