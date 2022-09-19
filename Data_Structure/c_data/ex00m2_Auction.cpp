#include <bits/stdc++.h>
using namespace std;
struct A {
    int u, v;
    bool operator<(const A& o) const {
        if (v != o.v)
            return v < o.v;
        else
            return u < o.u;
    }
};
int num[1000100];
vector<int> vv[1000100];
vector<map<int, int>> mp(1000100);
priority_queue<A> hp[1000100];
int main() {
    int n, m, a, i, j, k, u, v;
    char o;
    cin >> n >> m >> a;
    for (i = 1; i <= n; i++)
        cin >> num[i];
    while (a--) {
        cin >> o >> u >> k;
        if (o == 'B') {
            cin >> v;
            mp[k][u] = v;
        } else {
            auto it = mp[k].find(u);
            if (it != mp[k].end())
                mp[k].erase(it);
        }
    }
    for (i = 1; i <= n; i++) {
        for (auto x : mp[i])
            hp[i].push({x.first, x.second});
        j = 0;
        while (!hp[i].empty() && j++ < num[i]) {
            vv[hp[i].top().u].push_back(i);
            hp[i].pop();
        }
    }
    for (i = 1; i <= m; i++) {
        if (vv[i].size() == 0)
            cout << "NONE";
        else
            for (auto x : vv[i]) cout << x << " ";
        cout << "\n";
    }
}
/*

2 3 4
1 1
B 1 1 10
B 2 1 100
B 1 2 99
B 2 2 100

*/