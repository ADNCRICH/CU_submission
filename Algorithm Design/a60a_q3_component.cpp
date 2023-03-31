#include <bits/stdc++.h>
using namespace std;
vector<int> g[10010];
int cou, ma[10010];
void dfs(int u, int p) {
    ma[u] = 1;
    for (auto x : g[u]) {
        if (x == p || ma[x])
            continue;
        dfs(x, u);
    }
}
int main() {
    int v, e, i, a, b;
    cin >> v >> e;
    for (i = 0; i < e; i++) {
        cin >> a >> b;
        g[a].push_back(b);
        g[b].push_back(a);
    }
    for (i = 1; i <= v; i++) {
        if (!ma[i]) {
            dfs(i, -1);
            cou++;
        }
    }
    cout << cou << "\n";
    return 0;
}
