#include <bits/stdc++.h>
using namespace std;
vector<int> g[1010];
queue<int> q;
int in[1010];
int main() {
    int n, i, j, m, a;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> m;
        in[i] = m;
        for (j = 0; j < m; j++) {
            cin >> a;
            g[a].push_back(i);
        }
    }
    for (i = 0; i < n; i++)
        if (!in[i])
            q.push(i);
    while (!q.empty()) {
        int t = q.front();
        q.pop();
        cout << t << " ";
        for (auto x : g[t]) {
            in[x]--;
            if (!in[x])
                q.push(x);
        }
    }
    return 0;
}
