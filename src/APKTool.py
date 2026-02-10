import os

from src.CMD import CMD
from src.Global import Global
from src.OtherTool import OtherTool


class APKTool:

    def __init__(self, apk_tool_path=None, apk_signer_path=None):
        if apk_tool_path is None:
            self.apk_tool_path = Global.apktool
        else:
            self.apk_tool_path = apk_tool_path
        if apk_signer_path is None:
            self.apk_signer_path = Global.apksigner
        else:
            self.apk_signer_path = apk_signer_path

    def decompile_into(self, folder_path, apk_path):
        cmd = ["java", "-jar", self.apk_tool_path, "d", apk_path, "-o", folder_path]
        CMD.run(cmd)

    def compile(self, folder_path, apk_path):
        cmd = ["java", "-jar", self.apk_tool_path, "b", folder_path, "-o", apk_path]
        CMD.run(cmd)

    def sign(self, apk_path, keystore=None, alias="myalias", password=None):
        if keystore is None:
            keystore = Global.keystore
        if password is None:
            password = "pass:123456"
        else:
            password = "pass:" + password
        cmd = [self.apk_signer_path, "sign", "--ks", keystore, "--ks-key-alias", alias, "--ks-pass", password, apk_path]
        CMD.run(cmd)

    def compile_and_sign(self, folder_path, apk_path):
        OtherTool.del_file(apk_path)
        OtherTool.del_file(apk_path + ".idsig")
        OtherTool.del_folder(os.path.join(folder_path, "build"))
        self.compile(folder_path, apk_path)
        self.sign(apk_path)


