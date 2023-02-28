#include <bits/stdc++.h>
using namespace std;
int dp[35][35];
int main() {
    int i, j, n, k;
    cin >> n >> k;
    for (i = 0; i <= n; i++)
        dp[i][0] = 1;
    for (i = 1; i <= n; i++)
        for (j = 1; j <= k; j++) {
            dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j];
        }
    cout << dp[n][k];
}