#include <bits/stdc++.h>
using namespace std;
multiset<int> s;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, m, i, j, k, x, c = 1;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> x;
        s.insert(x);
    }
    for (i = 0; i < m; i++) {
        cin >> k;
        for (j = 0; j < k; j++) {
            cin >> x;
            auto it = s.upper_bound(x);
            if (it != s.end())
                s.erase(it);
            else {
                cout << c;
                return 0;
            }
        }
        c++;
    }
    cout << c;
}