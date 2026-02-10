import os
import shutil
import subprocess

from src.CMD import CMD


class OtherTool:

    def __init__(self):
        ...

    @staticmethod
    def copy_file(what, where):
        print("Copy:", what, "To:", where)
        shutil.copy(what, where)
        print("Done\n")

    @staticmethod
    def copy_folder(what, where):
        print("Copy:", what, "To:", where)
        shutil.copytree(what, where, dirs_exist_ok=False)
        print("Done\n")

    @staticmethod
    def del_file(what):
        print("Delete:", what)
        try:
            os.remove(what)
        except Exception as e:
            print("Can't remove:", e)
        print("Done\n")

    @staticmethod
    def make_dirs(where):
        os.makedirs(where, exist_ok=True)

    @staticmethod
    def del_folder(what):
        print("Delete:", what)
        try:
            shutil.rmtree(what)
        except Exception as e:
            print("Can't remove:", e)
        print("Done\n")

    @staticmethod
    def move_file(what, where):
        print("Move:", what, "To:", where)
        shutil.move(what, where)
        print("Done\n")

    @staticmethod
    def get_folder_path_from_file_path(file_path):
        return os.path.dirname(file_path)

    @staticmethod
    def get_file_name_from_file_path(file_path):
        return os.path.basename(file_path)

    @staticmethod
    def inject(what, where, offset):
        print("Start to inject:", what, "Into:", where, "Offset:", offset)
        with open(where, "rb+") as where_file:
            where_file.seek(offset)
            with open(what, "rb") as what_file:
                where_file.write(what_file.read())
        print("Done")

    @staticmethod
    def find_strings(file_path, grep=None, min_length=3):
        cmd_line = ["strings", "-n", str(min_length), file_path]
        if grep is None:
            CMD.run(cmd_line)
        else:
            strings_proc = subprocess.Popen(
                cmd_line,
                stdout=subprocess.PIPE
            )

            grep_proc = subprocess.run(
                ["grep", "-i", grep],
                stdin=strings_proc.stdout,
                capture_output=True,
                text=True
            )
            strings_proc.stdout.close()
            print(grep_proc.stdout)
