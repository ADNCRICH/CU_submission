#include <bits/stdc++.h>
using namespace std;
map<string, int> mp;
vector<pair<int, string>> v;
int main() {
    int n, k;
    string s;
    cin >> n >> k;
    while (n--) {
        cin >> s;
        mp[s]++;
    }
    for (auto x : mp)
        v.emplace_back(x.second, x.first);
    sort(v.rbegin(), v.rend());
    cout << v[min(k, (int)v.size()) - 1].first;
}