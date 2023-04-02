#include <bits/stdc++.h>
using namespace std;
vector<int> g[5050];
vector<int> gr[5050];
stack<int> st;
queue<pair<int, int>> q;
int onStack[5050], idx[5050], low[5050], cnt, t, grp[5050], cou, si[5050], in[5050], ans[5050], mk[5050][5050], mkg[5050];
void dfs(int u) {
    idx[u] = low[u] = ++cnt;
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
        cou++;
        do {
            if (st.empty()) break;
            t = st.top();
            st.pop();
            onStack[t] = 0, si[cou]++;
            grp[t] = cou;
        } while (t != u);
    }
}
int main() {
    int n, p, i, a, b;
    cin >> n >> p;
    for (i = 0; i < p; i++) {
        cin >> a >> b;
        g[a].push_back(b);
    }
    for (i = 0; i < n; i++) {
        if (!grp[i])
            dfs(i);
    }
    for (i = 0; i < n; i++)
        for (auto x : g[i]) {
            if (grp[i] != grp[x] && !mk[grp[i]][grp[x]]) {
                gr[grp[i]].push_back(grp[x]);
                in[grp[x]]++;
                mk[grp[i]][grp[x]] = 1;
            }
        }
    for (i = 0; i < n; i++)
        if (in[grp[i]] == 0 && !mkg[grp[i]]) {
            q.push({grp[i], 0}), mkg[grp[i]] = 1;
        }
    while (!q.empty()) {
        pair<int, int> t = q.front();
        q.pop();
        ans[t.second] += si[t.first];
        for (auto x : gr[t.first]) {
            in[x]--;
            if (in[x] == 0)
                q.push({x, t.second + 1});
        }
    }
    for (i = 0; ans[i] != 0; i++)
        cout << ans[i] << " ";
    return 0;
}
