from src.APKTool import APKTool
from src.Global import Global
from src.MT6768.Pipeline import Pipeline


# v2.2
if __name__ == '__main__':

    # Put USER.img into img/original/USER.img
    # If you upgrade the firmware for the first time then
    # put RetroArch_ra32.apk from (https://buildbot.libretro.com/stable/1.22.2/android/RetroArch_ra32.apk)
    # into img/original/apk/RetroArch_ra32.apk
    # If you upgrade the already upgraded firmware, you don't need to have RetroArch

    # override default result path (img/result/USER.img) if needed:
    # Pipeline.FINAL_USER_IMG_PATH = r"C:\Users\Sergey\Desktop\M88\USER.img"

    # Please check the audio of your game stick in a headphones: if you have only left channel working - leave fix_audio = True,
    # if you have both channels working - change this option to fix_audio = False
    fix_audio = True

    # It's highly recommended to download M88FW (https://github.com/SergeyVorobiev/M88-GameStick-Patch/releases/latest/download/M88FW.7z)
    # folder and put the folder M88FW/exec/jdk17 into this project - src/exec/jdk17
    # By using your own jdk and tools you can break the build and the firmware
    # Comment this line if you want to use your own jdk:
    Global.set_environment_jdk("exec/jdk17")

    # Keep in mind that if you have installed some frameworks in apktool it can also affect please clean them all
    # Check installed frameworks by this command:
    # APKTool().print_frameworks()
    Pipeline.repack_user(fix_audio, False)
