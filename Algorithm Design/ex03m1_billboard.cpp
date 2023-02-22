#include <bits/stdc++.h>
using namespace std;
int a[10010], dp[10010];
int main() {
    int n, i;
    cin >> n;
    for (i = 2; i < n + 2; i++)
        cin >> a[i];
    for (i = 2; i < n + 2; i++)
        dp[i] = max(dp[i - 1], dp[i - 2] + a[i]);
    cout << dp[n + 1];
}