from src.db.GamesDBBuilder import GamesDBBuilder
from src.db.GamesExplorer import GamesExplorer

if __name__ == '__main__':
    games_folder_path = r"H:\roms"
    games_data = GamesExplorer.find_all_games(games_folder_path)
    GamesDBBuilder.create_db_and_fill(games_data, games_folder_path, r"H:\roms\cachegames(updated).db")