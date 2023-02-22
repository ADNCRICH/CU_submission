#include <bits/stdc++.h>
using namespace std;
int a[25], dp[10010];
int main() {
    int n, m, i, j;
    cin >> n >> m;
    for (i = 0; i < n; i++)
        cin >> a[i];
    for (i = 1; i <= m; i++)
        dp[i] = 1e9;
    for (i = 0; i < n; i++)
        for (j = a[i]; j <= m; j++)
            dp[j] = min(dp[j], dp[j - a[i]] + 1);
    cout << dp[m];
}