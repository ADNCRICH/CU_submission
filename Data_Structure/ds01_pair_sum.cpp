#include <bits/stdc++.h>
using namespace std;
set<int> s;
int a[1000100], dp[2000100];
int main() {
    // ios_base::sync_with_stdio(false);
    // cin.tie(0);
    int n, m, x, i, j;
    cin >> n >> m;
    for (i = 0; i < n; i++)
        cin >> a[i];
    for (i = 0; i < n; i++)
        for (j = i + 1; j < n; j++)
            if (a[i] + a[j] <= 2000000)
                dp[a[i] + a[j]] = 1;
    // for (i = 0; i < 20; i++)
    //     cout << dp[i] << " ";
    while (m--) {
        cin >> x;
        cout << (dp[x] ? "YES\n" : "NO\n");
    }
}