#include <bits/stdc++.h>
using namespace std;
map<long long, long long> mp;
long long dfs(long long a, int st) {
    if (st == 2) return a;
    return dfs(mp[a], st + 1);
}
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    long long n, m, a, b;
    cin >> n >> m;
    while (n--) {
        cin >> a >> b;
        mp[b] = a;
    }
    while (m--) {
        cin >> a >> b;
        if (dfs(a, 0) == dfs(b, 0) && dfs(a, 0) != 0 && a != b)
            cout << "YES\n";
        else
            cout << "NO\n";
    }
}