#include <bits/stdc++.h>
using namespace std;
int dp[2][10010];
int main() {
    int n, m, i, j, k, x, ii = 1, jj = 0;
    cin >> n >> m;
    for (i = 1; i <= m; i++)
        dp[jj][i] = 1e9;
    for (i = 0; i < n; i++, ii = 1 - ii, jj = 1 - jj) {
        cin >> x;
        for (j = 0; j <= m; j++)
            dp[ii][j] = 1e9;
        for (j = m; j >= 0; j--) {
            for (k = 1; k <= 100; k++) {
                if (j - k * k < 0) break;
                dp[ii][j] = min(dp[ii][j], dp[jj][j - k * k] + (x - k) * (x - k));
            }
        }
    }
    cout << ((dp[n % 2][m] == 1e9) ? -1 : dp[n % 2][m]);
}