#include <bits/stdc++.h>
using namespace std;
int dp[50];
int main() {
    int n, i;
    cin >> n;
    dp[1] = dp[2] = 1;
    for (i = 3; i <= n; i++)
        dp[i] = dp[i - 1] + dp[i - 2];
    cout << dp[n];
}