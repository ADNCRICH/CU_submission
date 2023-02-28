#include <bits/stdc++.h>
using namespace std;
int dp[700100];
int main() {
    int n, i, k, idx, x;
    cin >> n;
    dp[1] = 1, dp[2] = 2;
    k = 2, idx = 2;
    for (i = 3; i <= 700000; i++) {
        if (idx++ == dp[k + 1])
            k++;
        dp[i] = dp[i - 1] + k;
    }
    while (n--) {
        cin >> x;
        cout << upper_bound(dp, dp + 700001, x) - dp - 1 << "\n";
    }
}