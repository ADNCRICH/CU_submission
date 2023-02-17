#include <bits/stdc++.h>
using namespace std;
int a[110][110], dp[110][110];
int main() {
    int n, i, j, ans = -1e9;
    cin >> n;
    for (i = 0; i < n; i++)
        for (j = 0; j <= i; j++)
            cin >> a[i][j];
    dp[0][0] = a[0][0];
    for (i = 1; i < n; i++)
        for (j = 0; j <= n; j++)
            dp[i][j] = a[i][j] + max(dp[i - 1][max(j - 1, 0)], dp[i - 1][j]);
    for (j = 0; j < n; j++)
        ans = max(ans, dp[n - 1][j]);
    cout << ans;
}