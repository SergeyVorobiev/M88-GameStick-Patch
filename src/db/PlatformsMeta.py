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
    "nesh": [".nes", ".fds", ".unf", ".unif", ".zip"],
    "ngpc": [".ngc", ".ngp", ".zip"],
    "pcengine": [".pce", ".bin", ".sgx", ".zip"],
    "wonderswan": [".ws", ".zip"],
    "wonderswancolor": [".wsc", ".zip"],
    "gbah": [".gba", ".agb", ".gbz", ".zip"],
    "genh": [".bin", ".gen", ".md", ".zip"],
    "mastersystem": [".sms", ".zip"],
    "NAOMI": [".zip"],
    "ngp": [".ngp", ".ngc", ".zip"],
    "pcenginecd": [".chd", ".cue", ".bin", ".iso", ".zip"],
    "atari5200": [".bin", ".a52", ".car", ".zip"],
    "ss": [".cue", ".iso", ".bin", ".chd", ".mdf", ".mds", ".m3u"],
    "dos": [".zip", ".dosz", ".exe", ".com", ".bat", ".iso", ".chd", ".cue", ".ins", ".img", ".ima", ".vhd" ,".jrc", ".tc" ,".m3u", ".m3u8", ".conf"],
}

art_map = {
    "PS2": "Sony - PlayStation 2",
    "psp": "Sony - PlayStation Portable",
    "psx": "Sony - PlayStation",
    "n64": "Nintendo - Nintendo 64",
    "dreamcast": "Sega - Dreamcast",
    "nds": "Nintendo - Nintendo DS",
    "arcade": "FBNeo - Arcade Games",
    "sfc": "Nintendo - Super Nintendo Entertainment System",
    "snes": "Nintendo - Super Nintendo Entertainment System",
    "atari7800": "Atari - 7800",
    "atarilynx": "Atari - Lynx",
    "cps1": "FBNeo - Arcade Games",
    "cps2": "FBNeo - Arcade Games",
    "cps3": "FBNeo - Arcade Games",
    "fbneo": "FBNeo - Arcade Games",
    "gamegear": "Sega - Game Gear",
    "gb": "Nintendo - Game Boy",
    "gba": "Nintendo - Game Boy Advance",
    "gbc": "Nintendo - Game Boy Color",
    "genesis": "Sega - Mega Drive - Genesis",
    "mame": "MAME",
    "megadrive": "Sega - Mega Drive - Genesis",
    "atari2600": "Atari - 2600",
    "nes": "Nintendo - Nintendo Entertainment System",
    "nesh": "Nintendo - Nintendo Entertainment System",
    "ngpc": "SNK - Neo Geo Pocket Color",
    "pcengine": "NEC - PC Engine TurboGrafx 16",
    "wonderswan": "Bandai - WonderSwan",
    "wonderswancolor": "Bandai - WonderSwan Color",
    "gbah": "Nintendo - Game Boy Advance",
    "genh": "Sega - Mega Drive - Genesis",
    "mastersystem": "Sega - Master System - Mark III",
    "NAOMI": "Sega - Naomi",
    "ngp": "SNK - Neo Geo Pocket",
    "pcenginecd": "NEC - PC Engine CD - TurboGrafx-CD",
    "atari5200": "Atari - 5200",
    "ss": "Sega - Saturn",
    "dos": "DOS",
}

system_files = [".pure.zip", "neogeo.zip", "naomi.zip", "naomi2.zip", "naomigd.zip", "pgm.zip"]

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