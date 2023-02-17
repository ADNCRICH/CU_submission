#include <bits/stdc++.h>
using namespace std;
int dp[2][33][33][33];  // [black/white][n][consecutive][switch]
int main() {
    int n, m, x, i, j, k, l, sumB, sumW, ans = 0;
    cin >> n >> m >> x;
    dp[0][1][1][0] = 1;
    for (i = 2; i <= n; i++) {
        for (k = 0; k <= x; k++) {
            if (k >= 1) {
                dp[0][i][1][k] = dp[1][i - 1][1][k - 1];
                dp[1][i][1][k] = dp[0][i - 1][1][k - 1];
            }
            for (j = 2; j <= m; j++) {
                dp[0][i][j][k] = dp[0][i - 1][j - 1][k];
                dp[1][i][j][k] = dp[1][i - 1][j - 1][k];
                if (k >= 1) {
                    dp[0][i][1][k] += dp[1][i - 1][j][k - 1];
                    dp[1][i][1][k] += dp[0][i - 1][j][k - 1];
                }
            }
        }
    }
    for (j = 1; j <= m; j++)
        ans += dp[0][n][j][x] + dp[1][n][j][x];

    cout << ans;
}