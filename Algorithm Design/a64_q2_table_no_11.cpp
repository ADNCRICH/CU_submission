#include <bits/stdc++.h>
using namespace std;
int dp[2][4];
int main() {
    int n, i, k = 1, mod = 100000007;
    cin >> n;
    dp[0][0] = dp[0][1] = dp[0][2] = 1;
    for (i = 1; i < n; i++, k = 1 - k) {
        // cout << k << "\n";
        dp[k][0] = (dp[1 - k][0] + dp[1 - k][1] + dp[1 - k][2]) % mod;
        dp[k][1] = (dp[1 - k][0] + dp[1 - k][2]) % mod;
        dp[k][2] = (dp[1 - k][0] + dp[1 - k][1]) % mod;
    }
    cout << (dp[1 - k][0] + dp[1 - k][1] + dp[1 - k][2]) % mod;
}