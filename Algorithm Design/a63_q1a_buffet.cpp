#include <bits/stdc++.h>
using namespace std;
int dp[200200];
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, k, m, i, j, p, w;
    cin >> n >> k >> m;
    for (i = 1; i <= n; i++) {
        cin >> dp[i];
        dp[i] += dp[i - 1] - m;
    }
    while (k--) {
        cin >> p >> w;
        cout << lower_bound(dp + p, dp + n + 1, dp[p - 1] + w) - dp << "\n";
    }
}