#include <bits/stdc++.h>
using namespace std;
int a[200200], b[200200], dp[200200][2];
int main() {
    int n, w, k, i, j;
    cin >> n >> w >> k;
    for (i = 1; i <= n; i++)
        cin >> a[i];
    for (i = 1; i <= n; i++)
        cin >> b[i];
    for (i = 1; i <= w; i++)
        dp[i][0] = max(dp[i - 1][0], a[i]), dp[i][1] = max(dp[i - 1][1], b[i]);
    for (i = w + 1; i <= n; i++)
        dp[i][0] = max(dp[i - 1][0], dp[i - w - 1][1] + a[i]), dp[i][1] = max(dp[i - 1][1], dp[i - w - 1][0] + b[i]);
    cout << max(dp[n][0], dp[n][1]);
}