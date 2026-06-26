import threading

from src.db.UI.GlobalUI import GlobalUI
from src.db.UI.Helpers.ClickableLink import ClickableLink
from src.db.UI.Helpers.VersionChecker import VersionChecker
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

        self.link.grid(row=0, column=0, padx=(15, 0), sticky="w")

        self.version = ClickableLink(parent,
                                     text=GlobalUI.version,
                                     url="", clickable=False)
        self.version.grid(row=0, column=1, padx=(0, 15), sticky="e")

        self.check_new_version()

    def check_new_version(self):
        def task():
            new_version = VersionChecker.check_new_version()
            self.__root.after(0, lambda: self.set_version(new_version))
        threading.Thread(target=task, daemon=True).start()

    def set_version(self, new_version):
        if new_version is None:
            return
        self.version = ClickableLink(self.__parent,
                                     text=GlobalUI.version + " (" + Strings.Current.DOWNLOAD_VERSION_LABEL + new_version["v"] + ")",
                                     url=new_version["url"], clickable=True)
        self.version.grid(row=0, column=1, padx=(0, 15), sticky="e")
