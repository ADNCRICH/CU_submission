#include <bits/stdc++.h>
using namespace std;
vector<int> g[1010];
queue<pair<int, int>> q;
int mk[1010], ans[1010], cou;
int main() {
    int n, e, k, i, a, b;
    cin >> n >> e >> k;
    for (i = 0; i < e; i++) {
        cin >> a >> b;
        g[a].push_back(b);
        g[b].push_back(a);
    }
    q.push({0, 0});
    mk[0] = 1;
    while (!q.empty()) {
        tie(a, b) = q.front();
        q.pop();
        if (b == k)
            ans[a] = 1;
        for (auto x : g[a]) {
            if (mk[x]) continue;
            mk[x] = 1;
            q.push({x, b + 1});
        }
    }
    for (i = 0; i <= n; i++)
        if (ans[i])
            cou++;
    cout << cou << "\n";
    return 0;
}
