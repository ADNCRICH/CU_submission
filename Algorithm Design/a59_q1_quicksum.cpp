#include <bits/stdc++.h>
using namespace std;
int a[1010][1010], dp[1010][1010];
int main() {
    int n, m, q, i1, i2, j1, j2;
    cin >> n >> m >> q;
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++) {
            cin >> a[i][j];
            dp[i][j] = a[i][j] + dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1];
        }
    while (q--) {
        cin >> i1 >> j1 >> i2 >> j2;
        i1++, i2++, j1++, j2++;
        cout << dp[i2][j2] - dp[i1 - 1][j2] - dp[i2][j1 - 1] + dp[i1 - 1][j1 - 1] << "\n";
    }
}