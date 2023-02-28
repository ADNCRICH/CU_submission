#include <bits/stdc++.h>
using namespace std;
int dp[550][550];
char a[550], b[550];
int main() {
    int i, j, la, lb;
    cin >> a + 1 >> b + 1;
    la = strlen(a + 1), lb = strlen(b + 1);
    for (i = 1; i <= la; i++)
        for (j = 1; j <= lb; j++) {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
            if (a[i] == b[j])
                dp[i][j] = max(dp[i][j], dp[i - 1][j - 1] + 1);
        }
    cout << dp[la][lb];
}