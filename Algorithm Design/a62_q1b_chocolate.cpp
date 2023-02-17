#include <bits/stdc++.h>
using namespace std;
int a[15], dp[10010];
int main() {
    int n, k, i, j;
    cin >> n >> k;
    for (i = 0; i < k; i++)
        cin >> a[i];
    sort(a, a + k);
    dp[0] = 1;
    for (i = a[0]; i <= n; i++)
        for (j = 0; j < k; j++)
            if (i - a[j] >= 0)
                dp[i] = (dp[i] + dp[i - a[j]]) % 1000003;
    cout << dp[n];
}