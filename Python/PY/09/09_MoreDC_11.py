for i in range(int(input())):
    a = input().strip()
    l = len(a)
    a = a.lstrip('.')

    print('.'*((l-len(a))//2) + a)
