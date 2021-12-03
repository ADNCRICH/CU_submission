def no_lowercase(t):
    a = [x for x in t if x.islower()]
    return len(a) == 0


def no_uppercase(t):
    a = [x for x in t if x.isupper()]
    return len(a) == 0
    pass


def no_number(t):
    a = [x for x in t if x.isnumeric()]
    return len(a) == 0


def no_symbol(t):
    a = [x for x in t if not x.isalnum()]
    return len(a) == 0


def character_repetition(t):
    t = t.lower()
    if len(t) >= 4:
        for i in range(0, len(t)-3):
            if t[i] == t[i+1] == t[i+2] == t[i+3]:
                return True
    return False


def isSequence(t, key):
    t = t.lower()
    for i in range(0, len(key)-3):
        fi = t.find(key[i:i+4])
        fi2 = t.find(key[i:i+4][::-1])
        if fi != -1 or fi2 != -1:
            return True
    return False


def number_sequence(t):
    return isSequence(t, "0123456789012")


def letter_sequence(t):
    return isSequence(t, "abcdefghijklmnopqrstuvwxyzabc")


def keyboard_pattern(t):
    ch = False
    ch |= isSequence(t, "!@#$%^&*()_+")
    ch |= isSequence(t, "qwertyuiop")
    ch |= isSequence(t, "asdfghjkl")
    ch |= isSequence(t, "zxcvbnm")
    return ch


passw = input().strip()
errors = []
if len(passw) < 8:
    errors.append("Less than 8 characters")
if no_lowercase(passw):
    errors.append("No lowercase letters")
if no_uppercase(passw):
    errors.append("No uppercase letters")
if no_number(passw):
    errors.append("No numbers")
if no_symbol(passw):
    errors.append("No symbols")
if character_repetition(passw):
    errors.append("Character repetition")
if number_sequence(passw):
    errors.append("Number sequence")
if letter_sequence(passw):
    errors.append("Letter sequence")
if keyboard_pattern(passw):
    errors.append("Keyboard pattern")
if len(errors) == 0:
    print("OK")
for i in errors:
    print(i)
