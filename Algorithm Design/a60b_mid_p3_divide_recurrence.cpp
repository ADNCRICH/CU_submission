#include <bits/stdc++.h>
using namespace std;
int a[510][510];
int play(int n, int k) {
    if (a[n][k] != -1) return a[n][k];
    return a[n][k] = (play(n - 1, k - 1) + k * play(n - 1, k)) % 1997;
}
int main() {
    int n, k;
    cin >> n >> k;
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= n; j++)
            a[i][j] = -1;
    for (int i = 0; i <= n; i++)
        a[i][i] = 1;
    cout << play(n, k);
}