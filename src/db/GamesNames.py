import sqlite3
from pathlib import Path


class GamesNames:

    @staticmethod
    def get_diff_images_map():
        result = {}
        path = "result/imagesdiff.txt"
        if not Path(path).is_file():
            return result
        with open(path, "r", encoding="utf-16") as f:
            readlines = f.readlines()
            for line in readlines:
                couple = line.split("<->")
                result[couple[0]] = couple[1][:-1]
        return result

    @staticmethod
    def build_image_names_diff():
        result = []
        with sqlite3.connect("H:\\cachegames56.db") as conn:
            try:
                cursor = conn.cursor()

                cursor.execute("SELECT path, image FROM game")
                rows = cursor.fetchall()

                for row in rows:
                    name = Path(row[2]).stem
                    image_name = Path(row[3]).stem
                    if not name.__eq__(image_name) and not "boxFront".__eq__(image_name):
                        line = name + "<->" + image_name
                        print(line)
                        result.append(line + "\n")
            finally:
                cursor.close()
                conn.close()
        with open("result/imagesdiff.txt", "w", encoding="utf-16") as f:
            f.writelines(result)

if __name__ == '__main__':
    GamesNames.build_image_names_diff()
