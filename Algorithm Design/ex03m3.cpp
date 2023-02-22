#include <bits/stdc++.h>
using namespace std;
int a[10010], dp[10010];
int main() {
    int n, k;
    cin >> n >> k;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        dp[i] = 1e9;
    }
    for (int i = 1; i <= n; i++)
        for (int j = max(1, i - k); j <= min(n, i + k); j++)
            dp[j] = min(dp[max(i - k - 1, 0)] + a[i], dp[j]);
    cout << dp[n];
}