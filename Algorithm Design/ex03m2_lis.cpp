#include <bits/stdc++.h>
using namespace std;
int a[1010], dp[1010], ans;
int main() {
    int n, i, j;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> a[i];
        dp[i] = 1;
    }
    for (i = 1; i < n; i++)
        for (j = 0; j < i; j++)
            if (a[j] < a[i])
                dp[i] = max(dp[i], dp[j] + 1), ans = max(ans, dp[i]);
    cout << ans;
}