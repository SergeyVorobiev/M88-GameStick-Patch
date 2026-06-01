import os
from pathlib import Path

from src.db.PlatformsMeta import extensions_map, ends_with_system, get_all_extensions


class GamesExplorer:

    @staticmethod
    def get_image_path(stem, platform_name, games_folder_path, images_diff_map=None):
        media_short_path = f"media/{stem}/boxFront.png"
        image_short_path = f"images/{stem}.png"
        platform_path = games_folder_path + "/" + platform_name + "/"
        media_path = platform_path + media_short_path
        if Path(media_path).is_file():
            return media_short_path, True
        media_path = platform_path + image_short_path
        if Path(media_path).is_file():
            return image_short_path, True
        if images_diff_map:
            diff_name = images_diff_map.get(stem)
            diff_short_path = f"images/{diff_name}.png"
            media_path = platform_path + diff_short_path
            if Path(media_path).is_file():
                return diff_short_path, True
        return image_short_path, False

    @staticmethod
    def find_all_games(path_to_games_folder, callback=None):
        result = {}
        total = 0
        extensions = get_all_extensions()
        for key, value in extensions_map.items():
            if callback:
                callback(key)
            folder_path = Path(path_to_games_folder + os.sep + key)
            if not folder_path.exists():
                continue
            for item in folder_path.iterdir():
                if item.is_file() and not ends_with_system(item.name) and extensions.__contains__(item.suffix.lower()):
                    try:
                        result[key].append(item)
                    except KeyError:
                        result[key] = [item]

            if result.get(key) is None:
                print("No games for:", key)
            else:
                print(key, result[key].__len__())
                total += result[key].__len__()
        print("Total:", total)
        return result