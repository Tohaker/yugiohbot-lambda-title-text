from text import *
from title import *


def lambda_handler(event, context):
    source_file = 'resources/cards_api.csv'

    nouns, adjectives = title.parse_existing_titles(source_file)
    card_title = title.create_new_title(nouns, adjectives)

    phrases = text.split_descriptions(source_file)
    card_text = text.generate_card_text(phrases)

    return {'title': card_title, 'text': card_text}


if __name__ == '__main__':
    print(lambda_handler(1, 2))
