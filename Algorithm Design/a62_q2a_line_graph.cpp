#include <bits/stdc++.h>
using namespace std;
vector<int> g[100100];
int mk[100100], ch, cou, c1;
void dfs(int u) {
    if (mk[u]) return;
    mk[u] = 1;
    if (g[u].size() > 2) {
        ch = false;
        return;
    }
    if (g[u].size() == 1)
        c1++;
    for (auto x : g[u]) {
        dfs(x);
    }
}
int main() {
    int v, e, a, b, i;
    cin >> v >> e;
    for (i = 0; i < e; i++) {
        cin >> a >> b;
        g[a].push_back(b);
        g[b].push_back(a);
    }
    for (i = 0; i < v; i++) {
        if (mk[i]) continue;
        ch = true, c1 = 0;
        dfs(i);
        if (g[i].size() == 0 || (ch && c1 == 2))
            cou++;
    }
    cout << cou;
    return 0;
}
