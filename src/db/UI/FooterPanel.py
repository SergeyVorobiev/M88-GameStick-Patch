from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.ClickableLink import ClickableLink
from src.db.UI.Strings import Strings


class FooterPanel:

    def __init__(self, root, parent):
        self.__root = root
        self.__parent = parent
        link = ClickableLink(parent,
                              text=Strings.Current.GITHUB_REPO_LABEL,
                              url=GlobalUI.github_url)
        link.pack(padx=15)