import re
import sqlite3
from src.db.GamesExplorer import GamesExplorer
from src.db.GamesNames import GamesNames


class GamesDBBuilder:

    @staticmethod
    def create_db_and_fill2(db_data, db_path, callback=None):
        con, cursor = GamesDBBuilder.create_empty_db(db_path)
        try:
            _id = 1
            game_id = 1
            for key, games in db_data.items():
                if games.__len__() == 0:
                    continue
                if callback:
                    callback(key)
                cursor.execute('''
                                        INSERT INTO categ (id, name, total, sort)
                                        VALUES (?, ?, ?, ?)
                                    ''', (_id, key, games.__len__(), 0))
                sorted_games = sorted(games, key=lambda p: p["ui_name"].lower())
                for path_data in sorted_games:
                    path = path_data['file_name']
                    image = path_data['image_path']
                    if image == "":
                        image = "images/" + path_data['ui_name'] + ".png"
                    ui_name = path_data['ui_name']
                    class_type = 0
                    game_type = 0
                    zh_cn = ui_name
                    en_us = ui_name
                    zh_tw = ui_name
                    ko_kr = ui_name
                    name = re.sub(r'[^a-zA-Z0-9]', '', path) + str(game_id)
                    fav = path_data['fav']
                    idx = game_id
                    gnum = f"{game_id:0{5}d}"
                    his = path_data['his']
                    sort = 0
                    cursor.execute('''
                                        INSERT INTO game (id, gameid, path, image, class_type, game_type, zh_CN, en_US, zh_TW, ko_KR, name, fav, idx, gnum, his, sort)
                                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                                    ''',
                                   (_id, game_id, path, image, class_type, game_type, zh_cn, en_us, zh_tw, ko_kr, name, fav,
                                    idx, gnum, his, sort))
                    game_id += 1
                _id += 1
        finally:
            con.commit()
            cursor.close()
            con.close()

    @staticmethod
    def create_db_and_fill(games_data, games_folder_path, db_path):
        con, cursor = GamesDBBuilder.create_empty_db(db_path)
        try:
            for key, value in games_data.items():
                cursor.execute('''
                                INSERT INTO categ (name, total, sort)
                                VALUES (?, ?, ?)
                            ''', (key, value.__len__(), 0))
            _id = 1
            game_id = 1
            images_diff_map = GamesNames.get_diff_images_map()
            for key, games in games_data.items():
                sorted_games = sorted(games, key=lambda p: p.name.lower())
                for path_data in sorted_games:
                    path = path_data.name
                    stem = path_data.stem
                    image, result = GamesExplorer.get_image_path(stem, key, games_folder_path, images_diff_map)
                    if not result:
                        print("Image with path:", key + "/" + image, "does not exist, consider to add one")
                    class_type = 0
                    game_type = 0
                    zh_cn = stem
                    en_us = stem
                    zh_tw = stem
                    ko_kr = stem
                    name = re.sub(r'[^a-zA-Z0-9]', '', path) + str(game_id)
                    fav = 0
                    idx = game_id
                    gnum = f"{game_id:0{5}d}"
                    his = 0
                    sort = 0
                    cursor.execute('''
                                                INSERT INTO game (id, gameid, path, image, class_type, game_type, zh_CN, en_US, zh_TW, ko_KR, name, fav, idx, gnum, his, sort)
                                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                                            ''', (_id, game_id, path, image, class_type, game_type, zh_cn, en_us, zh_tw, ko_kr, name, fav, idx, gnum, his, sort))
                    game_id += 1
                print("Done:", key)
                _id += 1
        finally:
            con.commit()
            cursor.close()
            con.close()

    @staticmethod
    def create_empty_db(path):
        conn = None
        cursor = None
        try:
            conn = sqlite3.connect(path)
            cursor = conn.cursor()

            cursor.execute("PRAGMA foreign_keys = ON;")

            cursor.execute('''
                    CREATE TABLE IF NOT EXISTS "categ" (
                        "id" INTEGER NOT NULL,
                        "total" INTEGER,
                        "name" TEXT,
                        "sort" INTEGER DEFAULT 0,
                        PRIMARY KEY ("id")
                    )
                ''')

            cursor.execute('''
                    CREATE TABLE IF NOT EXISTS "game" (
                        "id" INTEGER,
                        "gameid" INTEGER,
                        "path" TEXT,
                        "image" TEXT,
                        "class_type" INTEGER,
                        "game_type" INTEGER,
                        "zh_CN" TEXT,
                        "en_US" TEXT,
                        "zh_TW" TEXT,
                        "ko_KR" TEXT,
                        "name" TEXT,
                        "fav" INTEGER,
                        "idx" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT 0,
                        "gnum" TEXT,
                        "his" INTEGER DEFAULT 0,
                        "sort" INTEGER DEFAULT 0
                    )
                ''')
            conn.commit()
        except Exception as e:
            if conn:
                conn.close()
            if cursor:
                cursor.close()
            raise RuntimeError(e)
        return conn, cursor