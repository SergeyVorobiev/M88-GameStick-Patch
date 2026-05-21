import time


# Fix of wrong Treeview double click
class DoubleClick:
    def __init__(self):
        self.__object = None
        self.__last_click_time = -1
        self.__double_click_time = 0.25
        self.__click_num = 0

    def reset(self):
        self.__object = None
        self.__click_num = 0

    def is_double_click(self, obj):
        self.__click_num += 1
        current_time = time.time()
        if self.__click_num == 1:
            self.__object = obj
            self.__last_click_time = current_time
            return False
        past_time = current_time - self.__last_click_time
        self.__last_click_time = current_time
        if self.__click_num == 2:
            if self.__object != obj or past_time > self.__double_click_time:
                if self.__object != obj:
                    self.__object = obj
                self.__click_num = 1
                return False
            elif past_time < self.__double_click_time:
                self.__object = obj
                self.__click_num = 0
                return True
            else:
                self.__click_num = 0
        return False
