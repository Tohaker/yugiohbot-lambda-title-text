from text import *
from title import *
import requests


def lambda_handler(event, context):
    source_file = 'resources/cards_api.csv'

    nouns, adjectives = title.parse_existing_titles(source_file)
    card_title = title.create_new_title(nouns, adjectives)

    phrases = text.split_descriptions(source_file)
    card_text = text.generate_card_text(phrases)

    result = {'title': card_title, 'text': card_text}
    print(result)

    requests.get('https://card-generator-t4loex5l4q-ue.a.run.app/', params=result, timeout=120)

    return result


if __name__ == '__main__':
    print(lambda_handler(1, 2))
