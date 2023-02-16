#include <bits/stdc++.h>
using namespace std;
int a[10010], dp[10010];
int main() {
    int n, i;
    cin >> n;
    for (i = 0; i < n; i++)
        cin >> a[i];
    dp[0] = a[0];
    dp[1] = max(a[0], a[1]);
    dp[2] = max(a[2], dp[1]);
    for (i = 3; i < n; i++)
        dp[i] = max(dp[i - 3] + a[i], dp[i - 1]);
    cout << dp[n - 1];
}