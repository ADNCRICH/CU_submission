def no_lowercase(t):  # return True if no lowercase, otherwise return False
    a = [i for i in t if i.islower()]
    return len(a) == 0


def no_uppercase(t):
    a = [i for i in t if i.isupper()]
    return len(a) == 0


def no_number(t):
    a = [i for i in t if i.isnumeric()]
    return len(a) == 0


def no_symbol(t):
    a = [i for i in t if not i.isalnum()]
    return len(a) == 0


def character_repetition(t):
    t.lower()
    for i in range(len(t)-4+1):
        if t[i] == t[i+1] == t[i+2] == t[i+3]:
            return True
    return False


def check(t, key):
    t = t.lower()
    for i in range(len(key)-4+1):
        f = t.find(key[i:i+4])
        f2 = t.find(key[i:i+4][::-1])
        if f != -1 or f2 != -1:
            return True
    return False


def number_sequence(t):
    return check(t, "0123456789012")


def letter_sequence(t):
    return check(t, "abcdefghijklmnopqrstuvwxyzabc")


def keyboard_pattern(t):
    ch = False
    ch |= check(t, "!@#$%^&*()_+")
    ch |= check(t, "qwertyuiop")
    ch |= check(t, "asdfghjkl")
    ch |= check(t, "zxcvbnm")
    return ch


# -----------------------------
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
    print('OK')
else:
    print("\n".join(errors))
