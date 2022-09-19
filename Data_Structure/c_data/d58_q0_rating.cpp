#include <bits/stdc++.h>
using namespace std;
map<int, pair<int, int>> s;
map<string, pair<int, int>> t;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cout << fixed << setprecision(2);
    int n, a, p;
    string b;
    cin >> n;
    while (n--) {
        cin >> a >> b >> p;
        s[a].first += p, s[a].second++;
        t[b].first += p, t[b].second++;
    }
    for (auto x : s)
        cout << x.first << " " << (x.second.first + 0.0) / x.second.second << "\n";
    for (auto x : t)
        cout << x.first << " " << (x.second.first + 0.0) / x.second.second << "\n";
}