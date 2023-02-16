#include <bits/stdc++.h>
using namespace std;
int a[5], dp[4010], mk[4010];
int main() {
    int n, i, j;
    cin >> n;
    for (i = 0; i < 3; i++) cin >> a[i];
    for (i = 1; i <= n; i++)
        dp[i] = -1e9;
    for (i = 0; i < 3; i++) {
        if (mk[a[i]]) continue;
        for (j = a[i]; j <= n; j++)
            dp[j] = max(dp[j], dp[j - a[i]] + 1);
        mk[a[i]] = 1;
    }
    cout << dp[n];
}