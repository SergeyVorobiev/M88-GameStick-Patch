import re

from rapidfuzz import process, fuzz


class SimilarNames:

    @staticmethod
    def clean_name(name: str) -> str:
        name = name.lower()
        name = re.sub(r'[&\-_.()\[\]]', '', name)
        name = re.sub(r'\s+', '', name)
        return name

    @staticmethod
    def sort_by_similarity(q, names_list, limit=None):
        q = SimilarNames.clean_name(q)

        def scorer(a, b, score_cutoff=0):

            clean_a = a
            clean_b = SimilarNames.clean_name(b)

            scores = [
                fuzz.WRatio(a, b) * 0.4,
                fuzz.token_sort_ratio(a, b) * 0.25,
                fuzz.token_set_ratio(a, b) * 0.25,
                fuzz.partial_ratio(clean_a, clean_b) * 0.3,
                fuzz.ratio(clean_a, clean_b) * 0.2,
            ]
            return max(scores)

        result = []

        # noinspection PyTypeChecker
        sorted_names = process.extract(q, names_list, scorer=scorer, limit=limit)
        for name, score, index in sorted_names:
            result.append(name)
        return result