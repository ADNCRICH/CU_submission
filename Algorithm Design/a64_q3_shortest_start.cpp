#include <bits/stdc++.h>
using namespace std;
int dis[5050], st[5050];
struct A {
    int u, w;
    bool operator<(const A& o) const {
        return w > o.w;
    }
};
priority_queue<A> pq;
vector<A> g[5050];
int main() {
    int n, m, k, i, v, s, aa, bb, w, xx, ans = 1e9;
    cin >> n >> m >> k >> v;
    for (i = 0; i < k; i++) {
        cin >> xx;
        st[xx] = 1;
    }
    for (i = 0; i < m; i++) {
        cin >> aa >> bb >> w;
        g[bb].push_back({aa, w});
    }
    memset(dis, 0x3f, sizeof dis);
    pq.push({v, 0});
    dis[v] = 0;
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (t.w > dis[t.u])
            continue;
        for (auto x : g[t.u]) {
            if (t.w + x.w < dis[x.u]) {
                dis[x.u] = t.w + x.w;
                pq.push({x.u, dis[x.u]});
            }
        }
    }
    for (i = 0; i < n; i++)
        if (st[i])
            ans = min(ans, dis[i]);
    cout << ans;
    return 0;
}
