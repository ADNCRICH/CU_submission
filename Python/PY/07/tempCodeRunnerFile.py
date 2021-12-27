def no_lowercase(t):  # return True if no lowercase, otherwise return False
    a = [i for i in t if i.islower()]
    return len(a) == 0


print(no_lowercase("GEGHHEGED"))