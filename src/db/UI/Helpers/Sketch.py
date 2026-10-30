import os
from pathlib import Path

from src.Ext4ModifyTool import Ext4ModifyTool
from src.M88SHACompare import calculate_sha512


def check_rights_files(folder_name):
    path = Path("img/original/system_ao/system/" + folder_name)
    sys = "system/" + folder_name + "/"
    modify_tool = Ext4ModifyTool("img/updated/system_a.img")
    for item in path.iterdir():
        try:
            if item.is_file():
                name = sys + item.name
                result = modify_tool.get_stat(name)
        except Exception:
            ...

def compare_files2(folder_name):
    old_path = Path("img/original/system_ao/system/" + folder_name)
    new_path = Path("img/original/system_a/system/" + folder_name)
    for item in old_path.iterdir():
        try:
            if item.is_file():
                new_file_path = str(new_path) + os.sep + item.name
                if os.path.exists(new_file_path):
                    num1 = calculate_sha512(str(old_path) + os.sep + item.name)
                    num2 = calculate_sha512(new_file_path)
                    if num1 != num2:
                        print("Different: " + item.name)
                    else:
                        print("Same: " + item.name)
                else:
                    print("Not Exists: " + item.name)
        except Exception:
            print("Exception: " + item.name)

def compare_files(folder_name):
    new = Path("img/original/system_ao/system/" + folder_name)
    orig = Path("img/original/system_a/system/" + folder_name)
    orig_names = set()
    new_files = set()
    diff_names = set()

    for item in orig.iterdir():
        try:
            if item.is_file():
                orig_names.add(item.name)
        except Exception:
            print("Exception: " + item.name)
    for item in new.iterdir():
        try:
            if item.is_file():
                if not orig_names.__contains__(item.name):
                    new_files.add(item)
                    diff_names.add(item.name)
        except Exception:
            pass
    for item in diff_names:
        print(item)