#include <bits/stdc++.h>
using namespace std;
int a[1 << 8 + 3][1 << 8 + 3];
int main() {
    int n, k, i, j;
    cin >> n >> a[0][0];
    for (i = 0; i < 1 << n; i++) {
        a[i][0] = ((i == 0) ? a[0][0] : a[i - (i & -i)][0] + 1);
        for (j = 1; j < 1 << n; j++)
            a[i][j] = a[i][j - (j & -j)] - 1;
    }
    for (i = 0; i < 1 << n; i++) {
        for (j = 0; j < 1 << n; j++)
            cout << a[i][j] << " ";
        cout << "\n";
    }
}