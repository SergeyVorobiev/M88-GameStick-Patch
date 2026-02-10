import subprocess


class CMD:

    @staticmethod
    def run(cmd, cwd=None):
        print("Executing the command:", cmd)
        if cwd is None:
            result = subprocess.run(cmd, capture_output=True, text=True)
        else:
            result = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
        if result.stdout is not None and result.stdout.__len__() > 0:
            print(result.stdout)
        if result.stderr is not None and result.stderr.__len__() > 0:
            print(result.stderr)
        if result.returncode != 0:
            raise Exception("Error code:", result.returncode)
        print("Done\n")