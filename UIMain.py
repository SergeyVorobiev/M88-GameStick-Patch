from src.db.UI.ControlPanel import ControlPanel
from src.db.UI.FolderChooser import FolderChooser
from src.db.UI.FooterPanel import FooterPanel
from src.db.UI.GamesTable import GamesTable
from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Handlers import Handlers
from src.db.UI.ImagePanel import ImagePanel
from src.db.UI.MainLayout import MainLayout
from src.db.UI.PlatformsList import PlatformsList
from src.db.UI.Strings import Strings


if __name__ == '__main__':

    GlobalUI.root = MainLayout.get_window(Strings.Current.APP_TITLE, GlobalUI.icon, GlobalUI.app_width, GlobalUI.app_height)
    path_frame, btn_frame, image_frame, left_frame, right_frame, foot_frame = MainLayout(GlobalUI.root).get_frames()

    GlobalUI.folder_chooser = FolderChooser(GlobalUI.root, path_frame)
    GlobalUI.folder_chooser.set_choose_listener(Handlers.sd_path_selected)

    GlobalUI.control_panel = ControlPanel(GlobalUI.root, btn_frame)
    GlobalUI.control_panel.set_generate_db_listener(Handlers.on_generate_db_click)
    GlobalUI.control_panel.set_select_all_listener(Handlers.on_select_all_click)
    GlobalUI.control_panel.set_deselect_all_listener(Handlers.on_deselect_all_click)
    GlobalUI.control_panel.set_clean_game_folder_listener(Handlers.on_clean_game_folders_click)
    GlobalUI.control_panel.set_erase_history_listener(Handlers.on_erase_history)
    GlobalUI.control_panel.set_erase_favorites_listener(Handlers.on_erase_favorites)
    GlobalUI.control_panel.set_clean_image_folder_listener(Handlers.on_clean_image_folders_click)
    GlobalUI.control_panel.set_upgrade_firmware_listener(Handlers.on_upgrade_firmware_click)
    GlobalUI.image_frame = ImagePanel(GlobalUI.root, image_frame)

    GlobalUI.platforms_list = PlatformsList(GlobalUI.root, left_frame)
    GlobalUI.platforms_list.set_select_listener(Handlers.selected_platform)

    GlobalUI.games_table = GamesTable(GlobalUI.root, right_frame)
    GlobalUI.games_table.set_on_load_data_listener(Handlers.on_load_data)
    GlobalUI.games_table.set_on_check_listener(Handlers.on_row_check)
    GlobalUI.games_table.set_on_row_click_listener(Handlers.on_row_click)
    GlobalUI.games_table.set_on_image_click_listener(Handlers.on_image_click)
    GlobalUI.games_table.set_on_fav_click_listener(Handlers.on_fav_click_listener)
    GlobalUI.games_table.set_on_ui_name_click_listener(Handlers.on_ui_name_click)
    GlobalUI.games_table.set_on_file_name_click_listener(Handlers.on_file_name_click)

    GlobalUI.footer_frame = FooterPanel(GlobalUI.root, foot_frame)
    GlobalUI.root.mainloop()
