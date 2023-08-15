#include <bits/stdc++.h>
using namespace std;
map<string, int> mp;
map<string, string> ans;
struct A {
    string id;
    float sc;
    vector<string> v;
    bool operator<(const A &o) const {
        return sc > o.sc;
    }
};
int main() {
    int n, m, a;
    float sc;
    string s, id, p;
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> s >> a;
        mp[s] = a;
    }
    cin >> m;
    A st[m + 2];
    for (int i = 0; i < m; i++) {
        cin >> id >> sc;
        st[i].id = id;
        st[i].sc = sc;
        for (int j = 0; j < 4; j++) {
            cin >> p;
            st[i].v.push_back(p);
        }
    }
    sort(st, st + m);
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < 4; j++) {
            if (mp[st[i].v[j]] == 0) continue;
            mp[st[i].v[j]]--;
            ans[st[i].id] = st[i].v[j];
            break;
        }
    }
    for (auto x : ans) {
        cout << x.first << " " << x.second << "\n";
    }
}
