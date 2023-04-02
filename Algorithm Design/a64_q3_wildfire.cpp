#include <bits/stdc++.h>
using namespace std;
int mk[5050], b[5050], f[5050], cou, all;
vector<int> g[5050];
int play(int u) {
    if (mk[u]) return 0;
    mk[u] = 1;
    int sum = 0;
    for (auto x : g[u])
        sum += play(x);
    return sum + b[u];
}
int main() {
    int n, m, k, i, aa, bb;
    cin >> n >> m >> k;
    for (i = 0; i < n; i++) {
        cin >> b[i];
        all += b[i];
    }
    for (i = 0; i < k; i++) cin >> f[i];
    for (i = 0; i < m; i++) {
        cin >> aa >> bb;
        g[aa].push_back(bb);
    }

    for (i = 0; i < k; i++) {
        cou += play(f[i]);
        cout << all - cou << " ";
    }
    return 0;
}
