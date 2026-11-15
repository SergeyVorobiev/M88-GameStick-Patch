import os
import re
from pathlib import Path

from src.CMD import CMD
from src.Global import Global

class FileData:

    def __init__(self):
        self.type = ""
        self.mode = ""
        self.gid = ""
        self.uid = ""
        self.date = ""
        self.time = ""
        self.name = ""
        self.context = ""
        self.path = ""

    def is_dir(self):
        return self.type == "004"

    def is_file_or_symlink(self):
        return not self.is_dir()

    def __str__(self):
        return f"Path: {self.path} Type: {self.type} Mode: {self.mode} UID: {self.uid} GID: {self.gid} Context: {self.context}"

# To add and remove files you have to have - debugfs, truncate, resize2fs, etc
# install cygwin to get ability to use linux packages on windows, don't forget to add cygwin bins in PATH
class Ext4ModifyTool:

    def __init__(self, img_path):
        self.img_path = img_path


    # Does not support recursive deletion therefore dir must be empty
    # For recursive deletion see - remove_folder_with_files()
    def remove_file(self, path_to_file, is_file=True, debugfs=None, printc=None):
        if printc is None:
            printc = print
        if debugfs is None:
            debugfs = "debugfs"
        items = Ext4ModifyTool.prepare_path(path_to_file)
        if not items:
            printc("Empty path\n")
            return

        cmd_file = "modify_commands.txt"
        try:
            with open(cmd_file, 'w') as f:
                for item in items[:-1]:
                    f.write(f"cd {item}\n")
                last_item = items[-1]
                if is_file:
                    f.write(f"rm {last_item}\n")
                else:
                    f.write(f"rmdir {last_item}\n")
                f.write("q")
            CMD.run([debugfs, "-w", "-f", cmd_file, self.img_path], printc=printc)
        except Exception as e:
            printc(e)
        finally:
            if os.path.exists(cmd_file):
                os.remove(cmd_file)

    # turn A/B/C into [A, B, C]
    @staticmethod
    def prepare_path(path):
        if not path or path.__len__() == 0:
            return None
        clean_path = os.path.normpath(path).strip(os.sep)
        items = [item for item in clean_path.split(os.sep) if item]
        if not items or items.__len__() == 0:
            return None
        return items

    def format(self, mke2fs=None, printc=None):
        if printc is None:
            printc = print
        if mke2fs is None:
            mke2fs = "mke2fs"
        CMD.run([mke2fs, "-t", "ext4", self.img_path], printc=printc)

    @staticmethod
    def add_permissions(f, path, is_file, fo_mode=None, fi_mode=None):
        if is_file:
            if fi_mode is None:
                mode = '0106755' # 0104755 0100644 0106755 0106777
            else:
                mode = fi_mode
        else:
            if fo_mode is None:
                mode = '0755'
            else:
                mode = fo_mode
        f.write(f"set_inode_field {path} mode {mode}\n")

    # deprecated
    def set_file_permission(self, path_to_place, fi_mode=None, debugfs=None, printc=None):
        if debugfs is None:
            debugfs = "debugfs"
        if printc is None:
            printc = print
        items = Ext4ModifyTool.prepare_path(path_to_place)
        if not items:
            printc("Empty path\n")
            return
        cmd_file = "modify_commands.txt"
        try:
            with open(cmd_file, 'w') as f:
                for item in items[:-1]:
                    f.write(f"cd {item}\n")
                last_item = items[-1]
                Ext4ModifyTool.add_permissions(f, last_item, True, None, fi_mode)
                f.write("q")
            CMD.run([debugfs, "-w", "-f", cmd_file, self.img_path], printc=printc)
        except Exception as e:
            printc(e)
        finally:
            if os.path.exists(cmd_file):
                os.remove(cmd_file)

    # Create a mirror of folders and files from resources folder. They will be sent to the image one by one.
    # Resources folder is considered as root (/).
    def mirror_files(self, resources_folder_path=None):
        if not resources_folder_path:
            resources_folder_path = Global.resources_folder_name
        resources_path = Path(resources_folder_path)
        file_paths = [str(p.relative_to(resources_path)) for p in resources_path.rglob("*") if p.is_file()]
        for path in file_paths:
            self.add_file(os.path.join(resources_folder_path, path), path)

    # to exact size use '3G', '4G', to add use '+500M', '+1G'
    # truncate and resize2fs must be accessible on windows machine, use cygwin
    def resize_img(self, size='3G', truncate=None, resize2fs=None, printc=None):
        if truncate is None:
            truncate = "truncate"
        if resize2fs is None:
            resize2fs = "resize2fs"
        CMD.run([truncate, "-s", size, self.img_path], printc=printc)
        CMD.run([resize2fs, self.img_path], printc=printc)

    # to exact size use '3G', '4G', to add use '+500M', '+1G'
    def truncate_img(self, size='3G', truncate=None, printc=None):
        if truncate is None:
            truncate = "truncate"
        CMD.run([truncate, "-s", size, self.img_path], printc=printc)

    # add a single file to the image by using debugfs
    def add_file(self, path_to_file, path_to_place, is_file=True, add_permissions=False, debugfs=None, printc=None):
        if debugfs is None:
            debugfs = "debugfs"
        if printc is None:
            printc = print
        items = Ext4ModifyTool.prepare_path(path_to_place)
        if not items:
            printc("Empty path\n")
            return
        cmd_file = "modify_commands.txt"
        try:
            with open(cmd_file, 'w') as f:
                for item in items[:-1]:
                    f.write(f"mkdir {item}\n")
                    f.write(f"cd {item}\n")
                    if add_permissions:
                        Ext4ModifyTool.add_permissions(f, item, False)
                last_item = items[-1]
                if is_file:
                    f.write(f"write {path_to_file} {last_item}\n")
                else:
                    f.write(f"mkdir {last_item}\n")
                if add_permissions:
                    Ext4ModifyTool.add_permissions(f, last_item, is_file)
                f.write("q")
            CMD.run([debugfs, "-w", "-f", cmd_file, self.img_path], printc=printc)
        except Exception as e:
            printc(e)
        finally:
            if os.path.exists(cmd_file):
                os.remove(cmd_file)

    def check_file_exists(self, path, debugfs=None, printc=None):
        if not debugfs:
            debugfs = "debugfs"
        result = CMD.run([debugfs, "-R", "stat " + path, self.img_path], printc=printc)
        if "Inode:" in result.stdout:
            return True
        else:
            return False

    def get_stat(self, path, debugfs=None, printc=None):
        if not debugfs:
            debugfs = "debugfs"
        result = CMD.run([debugfs, "-R", "stat " + path, self.img_path], printc=printc)
        return result.stdout

    # f_type - '010' - file
    # f_type - '004' - folder
    # f_type - '012' - symlink
    # mode - '0600' like
    def set_rights(self, file_path, f_type, mode, uid=0, gid=0, debugfs=None, printc=None):
        lines = [
            f"set_inode_field {file_path} mode {f_type + mode}",
            f"set_inode_field {file_path} uid {uid}",
            f"set_inode_field {file_path} gid {gid}",
                 ]
        self.__execute_debugfs_file_command(lines, debugfs=debugfs, printc=printc)

    # context like "u:object_r:system_file:s0\\000"
    def set_selinux_context(self, file_path, context, debugfs=None, printc=None):
        lines = [f"ea_set {file_path} security.selinux {context}"]
        self.__execute_debugfs_file_command(lines, debugfs=debugfs, printc=printc)

    def __execute_debugfs_file_command(self, lines, debugfs=None, printc=None):
        if not debugfs:
            debugfs = "debugfs"
        cmd_file = "modify_commands.txt"

        try:
            with open(cmd_file, 'w') as f:
                for line in lines:
                    f.write(f"{line}\n")
                f.write("q")
            CMD.run([debugfs, "-w", "-f", cmd_file, self.img_path], printc=printc)
        except Exception as e:
            printc(e)
        finally:
            if os.path.exists(cmd_file):
                os.remove(cmd_file)

    # part must contain at least one alphabetic character, and must not have spaces
    def get_folder_names_contain_part(self, path, part, debugfs=None, printc=None):
        result = []
        if not debugfs:
            debugfs = "debugfs"
        out = CMD.run([debugfs, "-R", "ls -d " + path, self.img_path], printc=printc).stdout
        for p in out.split(" "):
            if p.__contains__(part):
                result.append(p)
        return result

    # part must contain at least one alphabetic character, and must not have spaces
    def get_apk_names_contain_part(self, path, part, debugfs=None, printc=None):
        result = []
        if not debugfs:
            debugfs = "debugfs"
        out = CMD.run([debugfs, "-R", "ls -c " + path, self.img_path], printc=printc).stdout
        for p in out.split(" "):
            if p.__contains__(part) and p.endswith(".apk"):
                result.append(p)
        return result

    # get first children (files, folders, symlinks)
    def get_ls_list(self, path, debugfs=None, printc=None):
        items = []
        if not debugfs:
            debugfs = "debugfs"

        result = CMD.run([debugfs, "-R", "ls -l " + path, self.img_path], printc=printc).stdout.split("\n")
        for item in result:
            if item == '':
                continue
            bits = item.split()
            mode = bits[1]
            type_f = "010"
            if mode.startswith("4"):
                type_f = "004" # folder
            elif mode.startswith("10"):
                type_f = "010" # file
            elif mode.startswith("12"):
                type_f = "012" # symlink
            uid = bits[3]
            gid = bits[4]
            date = bits[6]
            time = bits[7]
            name = item.split(time)[1].strip()
            if name == "." or name == "..":
                continue
            file_data = FileData()
            file_data.name = name
            file_data.type = type_f
            file_data.uid = uid
            file_data.gid = gid
            file_data.date = date
            file_data.time = time
            file_data.path = path + "/" + name
            mode, context, _, _ = self.get_file_meta_data(path, debugfs=debugfs, printc=printc)
            file_data.mode = mode
            file_data.context = context
            items.append(file_data)
        return items

    def get_ls_list_deep(self, path, result, debugfs=None, printc=None):
        items = self.get_ls_list(path, debugfs=debugfs, printc=printc)
        for item in items:
            result.append(item)
            if item.is_dir():
                self.get_ls_list_deep(item.path, result, debugfs=debugfs, printc=printc)

    def remove_folder_with_files(self, folder_path, include_root_folder=True, debugfs=None, printc=None):
        to_delete = []
        self.get_ls_list_deep(folder_path, to_delete, debugfs, printc)
        for item in reversed(to_delete):
            self.remove_file(item.path, item.is_file_or_symlink(), debugfs, printc)
        if include_root_folder:
            self.remove_file(folder_path, False, debugfs, printc)                                                                                                             \

    def get_file_meta_data(self, file_path, debugfs=None, printc=None):
        if printc is None:
            printc = print

        # noinspection PyUnusedLocal
        def printc_empty(*messages):
            ...

        text = self.get_stat(file_path.replace("\\", "/"), debugfs, printc_empty).split("\n")
        match = re.search(r"Mode:\s+(\S+)", text[0])
        mode = None
        if match:
            mode = match.group(1)
            if mode.__len__() == 3:
                mode = '0' + mode
            elif mode.__len__() == 5:
                mode = mode[1:]
            elif mode.__len__() != 4:
                printc("NON STANDARD MODE:", mode)
                mode = None
        context = None
        uid = -1
        gid = -1
        for te in text:
            if te.__contains__("security.selinux"):
                match = re.search(r'=\s*"([^"]+)"', te)
                if match:
                    context = match.group(1)
            match = re.search(r"User:\s*(\d+)\s*Group:\s*(\d+)", te)
            if match:
                uid = match.group(1)
                gid = match.group(2)
        return mode, context, uid, gid