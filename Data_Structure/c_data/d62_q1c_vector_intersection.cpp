#include <bits/stdc++.h>
using namespace std;
vector<int> v;
map<int, int> mp;
int main() {
    int n, m, x;
    cin >> n >> m;
    for (int i = 0; i < n; i++) {
        cin >> x;
        mp[x] = 1;
    }
    for (int i = 0; i < m; i++) {
        cin >> x;
        v.push_back(x);
    }
    sort(v.begin(), v.end());
    v.resize(unique(v.begin(), v.end()) - v.begin());
    for (auto x : v) {
        if (mp[x])
            cout << x << " ";
    }
}