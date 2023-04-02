#include <bits/stdc++.h>
using namespace std;
vector<int> g[1010];
int onStack[1010], idx[1010], low[1010], cnt, cou, si, t, ans[1010];
stack<int> st;
void dfs(int u) {
    low[u] = idx[u] = ++cnt;
    st.push(u);
    onStack[u] = 1;
    for (auto x : g[u]) {
        if (!idx[x]) {
            dfs(x);
            low[u] = min(low[u], low[x]);
        } else if (onStack[x])
            low[u] = min(low[u], idx[x]);
    }
    if (low[u] == idx[u]) {
        si = 0;
        do {
            if (st.empty()) break;
            t = st.top();
            st.pop();
            onStack[t] = 0, si++;
        } while (t != u);
        ans[cou++] = si;
    }
}
int main() {
    int n, m, a, i, j;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> m;
        for (j = 0; j < m; j++) {
            cin >> a;
            g[i].push_back(a);
        }
    }
    for (i = 0; i < n; i++)
        if (!idx[i])
            dfs(i);
    sort(ans, ans + cou);
    for (i = 0; i < cou; i++)
        cout << ans[i] << " ";
    // cout << "\n";
    // for (i = 0; i < n; i++)
    //     cout << idx[i] << " ";
    // cout << "\n";
    // for (i = 0; i < n; i++)
    //     cout << low[i] << " ";
    return 0;
}
