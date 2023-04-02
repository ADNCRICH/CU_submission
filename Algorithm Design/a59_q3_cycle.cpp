#include <bits/stdc++.h>
using namespace std;
vector<int> g[100100];
queue<int> q;
int in[100100], cou, mk[100100];
int main() {
    int n, a, b, i;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> a >> b;
        g[a].push_back(b);
        g[b].push_back(a);
        in[a]++, in[b]++;
    }
    for (i = 0; i < n; i++)
        if (in[i] <= 1) {
            q.push(i);
            mk[i] = 1;
        }
    while (!q.empty()) {
        int t = q.front();
        q.pop();
        cou++;
        for (auto x : g[t]) {
            if (mk[x]) continue;
            in[x]--;
            if (in[x] <= 1) {
                q.push(x);
                mk[x] = 1;
            }
        }
    }
    cout << n - cou << "\n";
    return 0;
}
