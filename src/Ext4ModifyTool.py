import os
from pathlib import Path

from src.CMD import CMD
from src.Global import Global


# To add and remove files you have to have - debugfs, truncate, resize2fs, etc
# install cygwin to get ability to use linux packages on windows, don't forget to add cygwin bins in PATH
class Ext4ModifyTool:

    def __init__(self, img_path):
        self.img_path = img_path

    # Does not support recursive deletion therefore dir must be empty
    def remove_file(self, path_to_file, is_file=True):
        items = Ext4ModifyTool.prepare_path(path_to_file)
        if not items:
            print("Empty path\n")
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
            CMD.run(["debugfs", "-w", "-f", cmd_file, self.img_path])
        except Exception as e:
            print(e)
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

    @staticmethod
    def add_permissions(f, path, is_file):
        if is_file:
            mode = '0100644'
        else:
            mode = '0755'
        f.write(f"set_inode_field {path} mode {mode}\n")

    def set_permission(self, path_to_place):
        items = Ext4ModifyTool.prepare_path(path_to_place)
        if not items:
            print("Empty path\n")
            return
        cmd_file = "modify_commands.txt"
        try:
            with open(cmd_file, 'w') as f:
                for item in items[:-1]:
                    f.write(f"cd {item}\n")
                last_item = items[-1]
                Ext4ModifyTool.add_permissions(f, last_item, True)
                f.write("q")
            CMD.run(["debugfs", "-w", "-f", cmd_file, self.img_path])
        except Exception as e:
            print(e)
        finally:
            if os.path.exists(cmd_file):
                os.remove(cmd_file)

    # Create a mirror of folders and files from resources folder it will be sent to the image one by one
    # by reconstructing the structure, resources folder is considered as the beginning (/)
    def mirror_files(self, resources_folder_path=None):
        if not resources_folder_path:
            resources_folder_path = Global.resources_folder_name
        resources_path = Path(resources_folder_path)
        file_paths = [str(p.relative_to(resources_path)) for p in resources_path.rglob("*") if p.is_file()]
        for path in file_paths:
            self.add_file(os.path.join(resources_folder_path, path), path)

    # to exact size use '3G', '4G', to add use '+500M', '+1G'
    # truncate and resize2fs must be accessible on windows machine, use cygwin
    def resize_img(self, size='3G'):
        CMD.run(["truncate", "-s", size, self.img_path])
        CMD.run(["resize2fs", self.img_path])

    # add a single file to the image by using debugfs
    def add_file(self, path_to_file, path_to_place, is_file=True, add_permissions=False):
        items = Ext4ModifyTool.prepare_path(path_to_place)
        if not items:
            print("Empty path\n")
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
            CMD.run(["debugfs", "-w", "-f", cmd_file, self.img_path])
        except Exception as e:
            print(e)
        finally:
            if os.path.exists(cmd_file):
                os.remove(cmd_file)



