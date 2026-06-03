from io import BytesIO

import requests
from bs4 import BeautifulSoup


class LibRetroArts:

    def __init__(self, proxy=None):
        self.url = "https://thumbnails.libretro.com/"
        self.box_arts = "/Named_Boxarts/"
        self.proxies = None
        self.set_proxy(proxy)
        self.chunk_size = 8192

    def download_image_and_safe(self, platform, game_name, path):
        buffer = self.download_image(platform, game_name)
        with open(path, 'wb') as f:
            f.write(buffer.getvalue())
        return True

    def set_proxy(self, proxy_string):
        if proxy_string is not None and proxy_string.__len__() > 0:
            self.proxies = {
                'http': proxy_string,
                'https': proxy_string,
            }
        else:
            self.proxies = None

    def download_image(self, platform, game_name):
        buffer = BytesIO()

        # noinspection PyBroadException
        try:
            platform = platform.replace(" ", "%20")
            game_name = game_name.replace(" ", "%20")
            url = self.url + platform + self.box_arts + game_name
            response = requests.get(url, proxies=self.proxies, timeout=(15, 30), stream=True)
            if response.status_code != 200:
                return buffer

            for chunk in response.iter_content(chunk_size=self.chunk_size):
                if chunk:
                    buffer.write(chunk)
        except:
            ...
        buffer.seek(0)
        return buffer

    def get_file_names(self, platform, as_arrays=True):
        platform = platform.replace(" ", "%20")
        url = self.url + platform + self.box_arts
        try:
            response = requests.get(url,
                                    proxies=self.proxies,
                                    timeout=(15, 30))

            if response.status_code != 200:
                print(f"Error {response.status_code}")
                return []

            soup = BeautifulSoup(response.text, 'html.parser')

            filenames = []

            for link in soup.find_all('a'):
                href = link.get('href')
                if href and href.endswith('.png'):
                    filename = requests.utils.unquote(href)
                    if as_arrays:
                        filenames.append([filename])
                    else:
                        filenames.append(filename)
            return filenames

        except Exception as e:
            print(f"Error: {e}")
            return []