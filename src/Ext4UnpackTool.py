import os

from src.CMD import CMD


class Ext4UnpackTool:

    # Unpack ext4 img into specified folder by using debugfs
    @staticmethod
    def unpack(what, where):
        os.makedirs(where, exist_ok=True)

        cmd = ['debugfs', '-R', f'rdump / {where}', what]
        CMD.run(cmd)

if __name__ == '__main__':
    ...