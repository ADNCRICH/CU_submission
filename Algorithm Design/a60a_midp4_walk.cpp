#include <bits/stdc++.h>
using namespace std;
int a[510][510], dp[510][510];
int main() {
    int i, j, n, m;
    cin >> n >> m;
    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++)
            cin >> a[i][j];
    for (j = 0; j < m; j++)
        dp[0][j] = dp[0][max(0, j - 1)] + a[0][j];
    for (i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + a[i][0];
        for (j = 1; j < m; j++) {
            dp[i][j] = a[i][j] + max(dp[i - 1][j], max(dp[i][j - 1], dp[i - 1][j - 1] + a[i][j]));
        }
    }
    cout << dp[n - 1][m - 1];
}