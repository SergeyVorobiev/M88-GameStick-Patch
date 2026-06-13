import subprocess


class CMD:

    @staticmethod
    def run(cmd, cwd=None, printc=None):
        try:
            if printc is None:
                printc = print
            printc("Executing the command:", cmd)
            if cwd is None:
                result = subprocess.run(cmd, capture_output=True, start_new_session=True, creationflags=subprocess.CREATE_NO_WINDOW, text=True)
            else:
                result = subprocess.run(cmd, cwd=cwd, start_new_session=True, creationflags=subprocess.CREATE_NO_WINDOW, capture_output=True, text=True)
            if result.stdout is not None and result.stdout.__len__() > 0:
                printc(result.stdout)
            if result.stderr is not None and result.stderr.__len__() > 0:
                printc(result.stderr)
            if result.returncode != 0:
                printc("Error code:", result.returncode)
                raise Exception("Error code:", result.returncode)
            printc("Done\n")
        except Exception as e:
            printc(e)
            raise e
        return result