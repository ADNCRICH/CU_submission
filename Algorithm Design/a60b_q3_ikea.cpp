#include <bits/stdc++.h>
using namespace std;
vector<int> g[1010], gg[1010];
int in[1010], inn[1010];
int main() {
    int n, e, q = 5, i, aa, bb, ch, k;
    cin >> n >> e;
    for (i = 0; i < e; i++) {
        cin >> aa >> bb;
        g[aa].push_back(bb);
        in[bb]++;
    }
    while (q--) {
        ch = 1;
        for (i = 1; i <= n; i++) {
            gg[i].clear();
            for (auto x : g[i])
                gg[i].push_back(x);
            inn[i] = in[i];
        }
        for (i = 0; i < n; i++) {
            cin >> k;
            if (inn[k] > 0) {
                ch = 0;
                // break;
            }
            for (auto x : gg[k])
                inn[x]--;
        }
        cout << (ch ? "SUCCESS\n" : "FAIL\n");
    }
    return 0;
}
