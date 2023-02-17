#include <bits/stdc++.h>
using namespace std;
int a[100100], dp[100100];
int main() {
    int n, i;
    cin >> n;
    for (i = 0; i < n; i++)
        cin >> a[i];
    dp[0] = a[0];
    for (i = 1; i < n; i++)
        dp[i] = a[i] + max(dp[i - 1], max(dp[max(i - 2, 0)], dp[max(i - 3, 0)]));
    cout << dp[n - 1];
}