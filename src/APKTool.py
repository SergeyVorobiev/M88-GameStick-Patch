import os

from src.CMD import CMD
from src.Global import Global
from src.OtherTool import OtherTool


class APKTool:

    def __init__(self, apk_tool_path=None, apk_signer_path=None, java=None, zipalign=None, jarsigner=None):
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
        if zipalign is None:
            self.zipalign = Global.zipalign
        else:
            self.zipalign = zipalign
        if jarsigner is None:
            self.jarsigner = "jarsigner"
        else:
            self.jarsigner = jarsigner

    def decompile_into(self, folder_path, apk_path, printc=None):
        cmd = [self.java, "-jar", self.apk_tool_path, "d", apk_path, "-o", folder_path]
        CMD.run(cmd, printc=printc)

    def compile(self, folder_path, apk_path, printc=None):
        cmd = [self.java, "-jar", self.apk_tool_path, "b", folder_path, "-o", apk_path]
        CMD.run(cmd, printc=printc)

    def verify_signature(self, apk_path, printc=None):
        cmd = [self.apk_signer_path, "verify", "--verbose", "--print-certs", apk_path]
        result = CMD.run(cmd, printc=printc)
        return result

    def verify_jar_signature(self, jar_path, printc=None):
        cmd = [self.jarsigner, "-verify", "-verbose", "-certs", jar_path]
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

    def sign_with_pk8(self, unsigned_path, align_path, signed_path, pk8_path, pem_path, printc=None):
        if align_path is not None:
            CMD.run([self.zipalign, "-v", "4", unsigned_path, align_path], printc=printc)
        else:
            align_path = unsigned_path
        cmd = [self.apk_signer_path, "sign", "--key", pk8_path, "--cert", pem_path, "--out", signed_path, align_path]
        CMD.run(cmd, printc=printc)

    def compile_and_sign(self, folder_path, apk_path, keystore=None, printc=None):
        OtherTool.del_file(apk_path, printc)
        OtherTool.del_file(apk_path + ".idsig", printc)
        OtherTool.del_folder(os.path.join(folder_path, "build"), printc)
        self.compile(folder_path, apk_path, printc)
        self.sign(apk_path, keystore=keystore, printc=printc)


