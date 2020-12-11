from string import ascii_lowercase

def get_letter(z, d):
    result = 0
    for letter in z:
        result += d[letter]
    return result

def make_dict():
    letter_dict = {}
    for i, letter in enumerate(ascii_lowercase):
        letter_dict[letter] = i+1
    return letter_dict

print(get_letter(input(), make_dict()) % 8)

