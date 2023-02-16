#include <bits/stdc++.h>
using namespace std;
int x, k;
unordered_map<int, int> mp, mk;
int play(int n) {
    if (n == 1)
        return x;
    if (mk[n])
        return mp[n];
    mk[n] = 1;
    return mp[n] = (play((n + 1) / 2) * play(n / 2)) % k;
}
int main() {
    int n;
    cin >> x >> n >> k;
    x %= k;
    cout << play(n);
}