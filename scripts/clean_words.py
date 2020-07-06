#! /usr/bin/python3

import os
import re
import subprocess


GIT_ROOT = subprocess.check_output(["git", "rev-parse", "--show-toplevel"],
                                   encoding='utf-8').rstrip('\n')

def validate_word(word: str) -> bool:
    pattern = r"([\d\.\"\'\-&]+)"
    match = re.search(pattern, word)
    if match:
        return False
    elif word == word.upper():
        return False

    return True


def clean_words(filepath: str):
    current_dir = os.getcwd()
    print(f"Currently at {current_dir}")

    print(f"Changing directory to {GIT_ROOT}")
    os.chdir(GIT_ROOT)

    print(f"Opening {filepath}")
    with open(filepath, 'r') as f:
        source = f.readlines()
        print(f"Got the source! {len(source)} words")
    cleaned = [x for x in source if validate_word(x)]
    print(f"Cleaned words, {len(cleaned)} lines left")
    with open(filepath, 'w') as f:
        new_source = ''.join(cleaned)
        f.writelines(new_source)

    print(f"Changing directory back to {current_dir}")
    os.chdir(current_dir)

    original_length = len(source)
    cleaned_length = len(cleaned)
    deleted = original_length - cleaned_length
    print("Cleaned {} words".format(deleted))


if __name__ == '__main__':
    clean_words('Sources/SpellingBee/words.txt')
