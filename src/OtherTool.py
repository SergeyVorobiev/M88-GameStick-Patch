import os
import shutil
import subprocess
from pathlib import Path

from src.CMD import CMD


class OtherTool:

    def __init__(self):
        ...

    @staticmethod
    def copy_file(what, where, create_folders=False, printc=None):
        if printc is None:
            printc = print
        if create_folders:
            OtherTool.make_dirs(Path(where).parent)
        printc("Copying:", what, "To:", where)
        shutil.copy(what, where)
        printc("Done\n")

    @staticmethod
    def copy_folder(what, where, printc=None):
        if printc is None:
            printc = print
        printc("Copying:", what, "To:", where)
        shutil.copytree(what, where, dirs_exist_ok=False)
        printc("Done\n")

    @staticmethod
    def del_file(what, printc=None):
        if printc is None:
            printc = print
        printc("Deleting:", what)
        try:
            os.remove(what)
        except Exception as e:
            printc("Can't delete:", e)
        printc("Done\n")

    @staticmethod
    def make_dirs(where):
        os.makedirs(where, exist_ok=True)

    @staticmethod
    def del_folder(what, printc=None):
        if printc is None:
            printc = print
        printc("Deleting:", what)
        try:
            shutil.rmtree(what)
        except Exception as e:
            printc("Can't delete:", e)
        printc("Done\n")

    @staticmethod
    def move_file(what, where, printc=None):
        if printc is None:
            printc = print
        printc("Moving:", what, "To:", where)

        # noinspection PyBroadException
        try:
            shutil.move(what, where)
            printc("Done\n")
            return True
        except:
            printc("Already Exists:", what)
            return False

    @staticmethod
    def get_folder_path_from_file_path(file_path):
        return os.path.dirname(file_path)

    @staticmethod
    def get_file_name_from_file_path(file_path):
        return os.path.basename(file_path)

    @staticmethod
    def inject(what, where, offset, printc=None):
        if printc is None:
            printc = print
        printc("Starting to inject:", what, "Into:", where, "Offset:", offset)
        with open(where, "rb+") as where_file:
            where_file.seek(offset)
            with open(what, "rb") as what_file:
                where_file.write(what_file.read())
        printc("Done")

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

    @staticmethod
    def read_file_lines(from_where):
        with open(from_where, 'r', encoding='utf-8') as file:
            lines = [line for line in file]
        return lines

    @staticmethod
    def add_lines_to_file(where, what):
        with open(where, "a") as file:
            file.writelines(what)