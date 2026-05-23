from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.ClickableLink import ClickableLink
from src.db.UI.Strings import Strings


class FooterPanel:

    def __init__(self, root, parent):
        self.__root = root
        self.__parent = parent
        parent.grid_columnconfigure(0, weight=1, pad=0)
        parent.grid_columnconfigure(1, weight=1, pad=0)

        self.link = ClickableLink(parent,
                              text=Strings.Current.GITHUB_REPO_LABEL,
                              url=GlobalUI.github_url)
        self.version = ClickableLink(parent,
                                  text=GlobalUI.version,
                                  url="", clickable=False)
        self.link.grid(row=0, column=0, padx=(15, 0), sticky="w")
        self.version.grid(row=0, column=1, padx=(0, 15), sticky="e")
