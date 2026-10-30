import os


class Root:
    def __init__(self):
        ...

    @staticmethod
    def get_root_dir_path():
        return os.path.abspath(os.path.dirname(__file__) + os.sep + ".." + os.sep)

    @staticmethod
    def get_src_dir_path():
        return os.path.abspath(os.path.dirname(__file__))

    @staticmethod
    def build_root_path(relative_to_root):
        return Root.get_root_dir_path() + os.sep + relative_to_root