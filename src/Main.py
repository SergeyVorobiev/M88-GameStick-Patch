from src.Global import Global
from src.MT6768.Pipeline import Pipeline

# Full installation includes: (+500MB) 8GB eMMC variant
# 1. Patch privileges
# 2. Add RetroArch32
# 3. Patch emu
# 4. Patch n64
# 5. Add AppLauncher
# 6. Add TotalCommander
# 7. Add [Aida, CPU-Z, Citra, Dolphin, Nether, RetroArch64] into system
# 8. Patch gamepad buttons
# 9. Patch audio
# 10. Replace Aether with Nether
FULL = 0

# Partial installation includes: (+300MB) 8GB / 4GB eMMC variant
# 1. Patch privileges
# 2. Add RetroArch32
# 3. Patch emu
# 4. Patch n64
# 5. Add AppLauncher
# 6. Add TotalCommander
# 7. Don't add [Aida, CPU-Z, Citra, Dolphin, Nether, RetroArch64] into system (they can be placed in ext_sd_card/Apps)
# 8. Patch gamepad buttons
# 9. Patch audio
# 10. Replace Aether with Nether
PARTIAL = 1

# Minimal installation includes: (+100MB) 8GB / 4GB eMMC variant
# 1. Patch privileges
# 2. Patch n64
# 3. Add AppLauncher
# 4. Add TotalCommander
# 5. Don't add [Aida, CPU-Z, Citra, Dolphin, Nether, RetroArch64] into system (they can be placed in ext_sd_card/Apps)
# 6. Patch gamepad buttons
# 7. Patch audio
# 8. Replace Aether with Nether
# In this variant the main UI is untouched, everything behaves by default. Updated functionality is accessible via AppLauncher.
MINIMAL = 2

# v2.3
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

    # It's recommended to download M88FW (https://github.com/SergeyVorobiev/M88-GameStick-Patch/releases/latest/download/M88FW.7z)
    # archive and put the folder M88FW/exec/jdk17 into this project to src/exec/jdk17
    # By using your own jdk and tools you can break the build and the firmware
    # Comment this line if you want to use your own jdk:
    Global.set_environment_jdk("exec/jdk17")

    # Be careful when you copy something from windows editors or use GIT, it may silently convert LF to CRLF breaking the build,
    # It's better to make sure that files in keychars, boot, system, audio folders uses LF.

    # If you have installed some additional frameworks in apktool be careful.
    # You also have to put (aida, cpuz, citra, dolphin, nether, retroarch64, applauncher, totalcommander)
    # apk files from M88FW archive into img/original/apk folder.

    # Just replace already patched n64 and emu instead of patching existing.
    # Copy n64 and emu from M88FW/replace/apk into replace/apk folder
    replace_emu_apk = False
    replace_n64_apk = False

    # Remove temporary files after finishing
    remove_temps = False

    Pipeline.repack_user(fix_audio, replace_emu_apk, replace_n64_apk, remove_temps, MINIMAL)


