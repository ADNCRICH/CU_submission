
# n = int(input())
# ans = {}
# for k in range(n):
#     a, b, c = input().split()
#     a += " "+b
#     if c not in ans:
#         ans[c] = []
#     ans[c] += [a]
#     if a not in ans:
#         ans[a] = []
#     ans[a] += [c]

# n = int(input())
# for i in range(n):
#     key = input().strip()
#     if key not in ans:
#         print(key + " --> Not found")
#     else:
#         print(key+" --> " + ", ".join(ans[key]))