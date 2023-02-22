#include <bits/stdc++.h>
using namespace std;
int dp[1010][1010], ans;
char a[1010][1010];
int main() {
    int n, m;
    cin >> n >> m;
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++)
            cin >> a[i][j];
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++)
            if (a[i][j] == '1')
                dp[i][j] = min(dp[i - 1][j], min(dp[i][j - 1], dp[i - 1][j - 1])) + 1, ans = max(ans, dp[i][j]);
    cout << ans;
}