#include <bits/stdc++.h>
using namespace std;
unordered_map<int, int> cou;
unordered_map<int, unordered_map<int, int> > mp;
int a[1050];
bool check(int x, int y, int z) {
    if (x == y && y == z && z == x) {
        if (cou[x] >= 3)
            return true;
        else
            return false;
    } else if (x == y) {
        if (cou[x] >= 2)
            return true;
        else
            return false;
    } else if (y == z) {
        if (cou[y] >= 2)
            return true;
        else
            return false;
    } else if (x == z) {
        if (cou[x] >= 2)
            return true;
        else
            return false;
    } else if (cou[x] && cou[y] && cou[z])
        return true;
    return false;
}
int main() {
    int n, m, i, j, x;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> a[i];
        cou[a[i]]++;
    }
    for (i = 0; i < n; i++)
        for (j = i + 1; j < n; j++)
            mp[a[i] + a[j]][a[i]]++;
    while (m--) {
        cin >> x;
        int ch = 0;
        for (i = 0; i < n; i++) {
            if (mp[x - a[i]].size() != 0) {
                for (auto k : mp[x - a[i]]) {
                    int x1 = k.first, x2 = x - a[i] - k.first;
                    if (check(a[i], x1, x2)) {
                        ch = 1;
                        goto end;
                    }
                    // cou[x1]--, cou[x2]--, cou[a[i]]--;
                    // // cout << x << " " << a[i] << " " << x1 << " " << x2 << " " << cou[x1] << " " << cou[x2] << " " << cou[a[i]] << "\n";
                    // if (cou[x1]++ >= 0 & cou[x2]++ >= 0 & cou[a[i]]++ >= 0) {
                    //     ch = 1;
                    //     // cout << a[i] << " " << x1 << " " << x2 << "\n";
                    //     goto end;
                    // }
                }
            }
        }
    end:
        cout << (ch ? "YES\n" : "NO\n");
    }
}