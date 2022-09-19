#include <bits/stdc++.h>
using namespace std;
set<pair<int, int>> s;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, m, i, a, b;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> a >> b;
        s.insert({a, b});
    }
    for (i = 0; i < m; i++) {
        cin >> a >> b;
        auto it = s.lower_bound({a, b});
        if (*it == make_pair(a, b))
            cout << "0 0 ";
        else if (it != s.begin()) {
            it--;
            cout << (*it).first << " " << (*it).second << " ";
        } else
            cout << "-1 -1 ";
    }
}
/*

3 4
2019 10
2020 1
2020 8
2020 1
2019 12
2020 11
2018 1

*/