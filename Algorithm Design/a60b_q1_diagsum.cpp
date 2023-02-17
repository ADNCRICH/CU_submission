#include <bits/stdc++.h>
using namespace std;
int a[1010][1010], dp[1010][1010], ans = -1e9;
int main() {
    cin.tie(0)->sync_with_stdio(0);
    int n, i, j;
    cin >> n;
    for (i = 1; i <= n; i++)
        for (j = 1; j <= n; j++)
            cin >> a[i][j];
    for (i = 0; i <= n; i++)
        for (j = 0; j <= n; j++)
            dp[i][j] = -1e9;
    for (i = 1; i <= n; i++)
        for (j = 1; j <= n; j++)
            dp[i][j] = a[i][j] + max(0, dp[i - 1][j - 1]), ans = max(ans, dp[i][j]);
    cout << ans;
}