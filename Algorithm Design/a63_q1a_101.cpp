#include <bits/stdc++.h>
using namespace std;
int dp[10010][2];
int main() {
    int n, i, mod = 100000007;
    cin >> n;
    dp[0][0] = dp[0][1] = dp[1][0] = dp[1][1] = 1;
    for (i = 2; i <= n; i++) {
        dp[i][0] += dp[i - 1][0] + dp[i - 1][1];
        dp[i][0] %= mod;
        // dp[i][1] += dp[i - 1][1] + dp[i - 1][0] - dp[i - 2][1] + mod;
        dp[i][1] += dp[i - 1][1] + dp[i - 2][0];
        dp[i][1] %= mod;
    }
    cout << (dp[n][0] + dp[n][1]) % mod;
}