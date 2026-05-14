from src.MT6768.Pipeline import Pipeline


if __name__ == '__main__':

    # Put USER.img into img/original/USER.img
    # Put RetroArch_ra32.apk from (https://buildbot.libretro.com/stable/1.22.2/android/RetroArch_ra32.apk)
    # into img/original/apk/RetroArch_ra32.apk, or it will be downloaded automatically

    # override default result path (img/result/USER.img) if needed:
    # Pipeline.FINAL_USER_IMG_PATH = r"C:\Users\Sergey\Desktop\M88\USER.img"
    Pipeline.repack_user()
