#include <bits/stdc++.h>
using namespace std;
int a[110], dp[110][110];
int play(int l, int r) {
    if (l == r) return 0;
    if (dp[l][r] != -1) return dp[l][r];
    dp[l][r] = 1e9;
    for (int i = l; i < r; i++)
        dp[l][r] = min(dp[l][r], play(l, i) + play(i + 1, r) + a[l] * a[i + 1] * a[r + 1]);
    return dp[l][r];
}
int main() {
    int n, i;
    cin >> n;
    memset(dp, -1, sizeof dp);
    for (i = 0; i <= n; i++)
        cin >> a[i];
    cout << play(0, n - 1);
}