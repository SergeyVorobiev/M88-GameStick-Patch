import requests

from src.db.UI.GlobalUI import GlobalUI


class VersionChecker:

    @staticmethod
    def check_new_version():
        try:
            response = requests.get(GlobalUI.repo_latest_url, timeout=30)
            response.raise_for_status()

            data = response.json()
            for item in data["assets"]:
                name = item["name"]
                if name.startswith(GlobalUI.app_name):
                    version = name.split("_")[1][:-4]
                    if version != GlobalUI.version[1:]:
                        return {"v": version,
                                "url": item['browser_download_url']}
                    else:
                        return None
            return None
        except:
            return None