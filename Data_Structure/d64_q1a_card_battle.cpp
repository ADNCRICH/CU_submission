#include <bits/stdc++.h>
using namespace std;
map<int, int> mp;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, m, i, j, k, x, c = 1;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> x;
        mp[x]++;
    }
    for (i = 0; i < m; i++) {
        cin >> k;
        for (j = 0; j < k; j++) {
            cin >> x;
            auto it = mp.upper_bound(x);
            if (it != mp.end()) {
                (*it).second--;
                if ((*it).second == 0)
                    mp.erase(it);
            } else {
                cout << c;
                return 0;
            }
        }
        c++;
    }
    cout << c;
}