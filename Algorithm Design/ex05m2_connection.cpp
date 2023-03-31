#include <bits/stdc++.h>
using namespace std;
struct A {
    int v, d;
};
queue<A> q;
int cou, mk[1010], ma = -1, idx;
vector<int> g[1010];
int main() {
    cin.tie(0)->sync_with_stdio(0);
    int n, e, k, i, a, b;
    cin >> n >> e >> k;
    for (i = 0; i < e; i++) {
        cin >> a >> b;
        g[a].push_back(b);
        g[b].push_back(a);
    }
    for (i = 0; i < n; i++) {
        q.push({i, 0});
        mk[i] = 1, cou = 0;
        while (!q.empty()) {
            A t = q.front();
            q.pop();
            if (t.d <= k) {
                cou++;
            }
            for (auto x : g[t.v]) {
                if (mk[x]) continue;
                q.push({x, t.d + 1});
                mk[x] = 1;
            }
        }
        memset(mk, 0, sizeof mk);
        // cerr << "OUTPUT : " << i << " " << cou << endl;
        if (cou > ma)
            ma = cou, idx = i;
    }
    cout << ma << "\n";
    return 0;
}
