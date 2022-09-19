#include <bits/stdc++.h>
using namespace std;
set<pair<int, int>> s1, s2;
vector<int> v;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, w, i, k;
    cin >> n >> w;
    for (i = 0; i < w; i++) {
        cin >> k;
        v.push_back(k);
        s1.insert({k, i});
    }
    for (i = w; i < n; i++) {
        cin >> k;
        v.push_back(k);
        s1.insert({k, i});
        while (s1.size() > s2.size()) {
            s2.insert(*(--s1.end()));
            s1.erase(--s1.end());
        }
        while (s2.size() >= s1.size()) {
            s1.insert(*(s2.begin()));
            s2.erase(s2.begin());
        }
        int ans = (--s1.end())->first;
        cout << ans << " ";
        if (v[i - w] <= ans)
            s1.erase({v[i - w], i - w});
        else
            s2.erase({v[i - w], i - w});
    }
}