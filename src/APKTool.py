import os

from src.CMD import CMD
from src.Global import Global
from src.OtherTool import OtherTool


class APKTool:

    def __init__(self, apk_tool_path=None, apk_signer_path=None, java=None):
        if java is None:
            self.java = Global.java
        else:
            self.java = java
        if apk_tool_path is None:
            self.apk_tool_path = Global.apktool
        else:
            self.apk_tool_path = apk_tool_path
        if apk_signer_path is None:
            self.apk_signer_path = Global.apksigner
        else:
            self.apk_signer_path = apk_signer_path

    def decompile_into(self, folder_path, apk_path, printc=None):
        cmd = [self.java, "-jar", self.apk_tool_path, "d", apk_path, "-o", folder_path]
        CMD.run(cmd, printc=printc)

    def compile(self, folder_path, apk_path, printc=None):
        cmd = [self.java, "-jar", self.apk_tool_path, "b", folder_path, "-o", apk_path]
        CMD.run(cmd, printc=printc)

    def verify_signature(self, apk_path, printc=None):
        cmd = [self.apk_signer_path, "verify", "--verbose", "--print-certs", apk_path]
        CMD.run(cmd, printc=printc)

    def print_frameworks(self):
        cmd = [self.java, "-jar", self.apk_tool_path, "list-frameworks"]
        CMD.run(cmd, printc=None)

    def sign(self, apk_path, keystore=None, alias="myalias", password=None, printc=None):
        if keystore is None:
            keystore = Global.keystore
        if password is None:
            password = "pass:123456"
        else:
            password = "pass:" + password
        cmd = [self.apk_signer_path, "sign", "--ks", keystore, "--ks-key-alias", alias, "--ks-pass", password, apk_path]
        CMD.run(cmd, printc=printc)

    def compile_and_sign(self, folder_path, apk_path, keystore=None, printc=None):
        OtherTool.del_file(apk_path, printc)
        OtherTool.del_file(apk_path + ".idsig", printc)
        OtherTool.del_folder(os.path.join(folder_path, "build"), printc)
        self.compile(folder_path, apk_path, printc)
        self.sign(apk_path, keystore=keystore, printc=printc)


