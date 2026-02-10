import os

from src.OtherTool import OtherTool

if __name__ == "__main__":
    #path = r"img/updated/d_apk/emu"
    path = r"img/updated/d_apk/emu/lib/armeabi-v7a"
    #OtherTool.find_strings(path2, grep="pcsx")
   # exit(0)
    str_part = "dlopen"
    len_before = 10
    len_after = str_part.__len__() + 100
    check_register = True
    if not check_register:
        str_part = str_part.lower()

    print(f"Looking for '{str_part}' in the folder: {path}\n")

    for root, dirs, files in os.walk(path):
        for file in files:
            file_path = os.path.join(root, file)

            try:
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    if not check_register:
                        content = content.lower()
                    index = 0
                    while index > -1:
                        index = content.find(str_part, index)
                        if index != -1:
                            start = index - len_before
                            end = index + len_after
                            sub = content[start: end]
                            print(file_path, sub)
                            index += 1
            except Exception as e:
                print("Fail on:", file_path)
                pass