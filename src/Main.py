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
    Pipeline.repack_user(fix_audio)
