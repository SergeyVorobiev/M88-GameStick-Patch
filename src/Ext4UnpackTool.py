import os

from src.CMD import CMD


class Ext4UnpackTool:

    # Unpack ext4 img into specified folder by using debugfs
    @staticmethod
    def unpack(what, where, debugfs=None, printc=None):
        os.makedirs(where, exist_ok=True)
        if debugfs is None:
            debugfs = 'debugfs'
        cmd = [debugfs, '-R', f'rdump / {where}', what]
        CMD.run(cmd, printc=printc)

if __name__ == '__main__':
    ...