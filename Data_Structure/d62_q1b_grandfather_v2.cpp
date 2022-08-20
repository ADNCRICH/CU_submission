#include <bits/stdc++.h>
using namespace std;
unordered_map<long long, long long> mp;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    long long n, m, a, b, pa, pb;
    cin >> n >> m;
    while (n--) {
        cin >> a >> b;
        mp[b] = a;
    }
    while (m--) {
        cin >> a >> b;
        pa = mp[mp[a]];
        pb = mp[mp[b]];
        if (pa == pb && pa != 0 && a != b)
            cout << "YES\n";
        else
            cout << "NO\n";
    }
}