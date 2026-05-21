import os
import sqlite3


class DBExtractor:

    # Returns {
    #             relative_game_path : [relative_image_path, game_name],
    #             ...,
    #         }
    @staticmethod
    def get_names(path_to_db):
        result = {}
        with sqlite3.connect(path_to_db) as conn:
            try:
                cursor = conn.cursor()
                cursor.execute("SELECT path, image, en_US FROM game")
                rows = cursor.fetchall()

                for row in rows:
                    name = row[0]
                    image_name = row[1]
                    game_name = row[2]
                    result[name] = [image_name, game_name]
            finally:
                cursor.close()
                conn.close()
        return result

    # Returns {
    #             platform: {
    #                 relative_game_path : [relative_image_path, game_name, favorite, history],
    #                 ...,
    #             }
    #             ...,
    #         }
    @staticmethod
    def get_data(path_to_db):
        result = {}
        platforms = {}
        if not os.path.exists(path_to_db):
            return result

        # noinspection PyBroadException
        try:
            with sqlite3.connect(path_to_db) as conn:
                try:
                    cursor = conn.cursor()
                    cursor.execute("SELECT id, name FROM categ")
                    rows = cursor.fetchall()
                    for row in rows:
                        platforms[row[0]] = row[1]
                    cursor.execute("SELECT path, image, en_US, fav, his, id, gnum FROM game")
                    rows = cursor.fetchall()
                    for row in rows:
                        name = row[0]
                        image_name = row[1]
                        game_name = row[2]
                        fav = row[3]
                        his = row[4]
                        gnum = row[6]
                        platform = platforms[row[5]]

                        # noinspection PyBroadException
                        try:
                            platform_dict = result[platform]
                        except:
                            platform_dict = {}
                            result[platform] = platform_dict
                        platform_dict[name] = [image_name, game_name, fav, his, gnum]
                finally:

                    # 'with' does not close things properly, is not it a language contract violation?
                    cursor.close()
                    conn.close()
        except:
            ...
        return result
