#include <bits/stdc++.h>
using namespace std;
vector<int> g[1010];
int in[1010];
queue<int> q;
int main() {
    cin.tie(0)->sync_with_stdio(0);
    int Q, n, e, u, v;
    cin >> Q;
    while (Q--) {
        cin >> n >> e;
        for (int i = 0; i < e; i++) {
            cin >> u >> v;
            g[u].push_back(v);
            g[v].push_back(u);
            in[u]++, in[v]++;
        }
        for (int i = 0; i < n; i++)
            if (in[i] <= 1)
                q.push(i);
        int cou = 0;
        while (!q.empty()) {
            u = q.front();
            q.pop();
            cou++;
            for (auto x : g[u]) {
                if (in[x] == 1)
                    continue;
                --in[x];
                if (in[x] == 1)
                    q.push(x);
            }
        }
        for (int i = 0; i < n; i++)
            g[i].clear(), in[i] = 0;
        cout << ((cou != n) ? "YES\n" : "NO\n");
    }
    return 0;
}
