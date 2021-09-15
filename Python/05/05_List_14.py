a = [float(i) for i in input().split()]

n = [i for i in range(1, len(a)-1) if a[i] > a[i-1] and a[i] > a[i+1]]

print(len(n))
