extensions_map = {
    "PS2": [".iso", ".chd", ".gz", ".cso", ".zip"],
    "psp": [".iso", ".chd", ".cso", ".pbp", ".zip"],
    "psx": [".bin", ".cue", ".chd", ".iso", ".pbp", ".img", ".ccd", ".mdf", ".zip"],
    "n64": [".z64", ".n64", ".v64", ".zip"],
    "dreamcast": [".gdi", ".chd", ".cdi", ".bin", ".cue", ".zip"],
    "nds": [".nds", ".srl", ".zip"],
    "arcade": [".zip", ".smd", ".chd"],
    "sfc": [".sfc", ".smc", ".fig", ".gd3", ".gd7", ".dx2", ".bsx", ".swc", ".zip"],
    "snes": [".sfc", ".smc", ".zip"],
    "atari7800": [".a78", ".bin", ".zip"],
    "atarilynx": [".lnx", ".zip"],
    "cps1": [".zip"],
    "cps2": [".zip"],
    "cps3": [".zip"],
    "fbneo": [".zip"],
    "gamegear": [".gg", ".sms", ".zip"],
    "gb": [".gb", ".zip"],
    "gba": [".gba", ".agb", ".gbz", ".zip"],
    "gbc": [".gbc", ".zip"],
    "genesis": [".bin", ".gen", ".md", ".smd", ".zip"],
    "mame": [".zip"],
    "megadrive": [".bin", ".gen", ".md", ".smd", ".zip"],
    "atari2600": [".bin", ".a26", ".zip"],
    "nes": [".nes", ".fds", ".unf", ".unif", ".zip"],
    "nesh": [".nes", ".zip"],
    "ngpc": [".ngc", ".ngp", ".zip"],
    "pcengine": [".pce", ".bin", ".sgx", ".zip"],
    "wonderswan": [".ws", ".zip"],
    "wonderswancolor": [".wsc", ".zip"],
    "gbah": [".gba", ".zip"],
    "genh": [".bin", ".gen", ".md", ".zip"],
    "mastersystem": [".sms", ".zip"],
    "NAOMI": [".zip"],
    "ngp": [".ngp", ".ngc", ".zip"],
    "pcenginecd": [".chd", ".cue", ".bin", ".iso", ".zip"],
    "atari5200": [".bin", ".a52", ".car", ".zip"],
    "ss": [".cue", ".iso", ".bin", ".chd", ".mdf", ".mds", ".m3u"],
    "dos": [".zip", ".dosz", ".exe", ".com", ".bat", ".iso", ".chd", ".cue", ".ins", ".img", ".ima", ".vhd" ,".jrc", ".tc" ,".m3u", ".m3u8", ".conf"],

}

system_files = [".pure.zip", "neogeo.zip", "naomi.zip", "naomi2.zip", "naomigd.zip"]

def get_all_extensions():
    result = set()
    for key, value in extensions_map.items():
        for ext in value:
            result.add(ext)
    return result

def ends_with_system(file_name):
    for f in system_files:
        if file_name.endswith(f):
            return True
    return False