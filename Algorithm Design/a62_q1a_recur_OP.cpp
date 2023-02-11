#include <bits/stdc++.h>
using namespace std;
short a[1 << 8 + 3][1 << 4 + 3];
int main() {
    short n, i, j;
    cin >> n >> a[0][0];
    for (i = 0; i < 1 << n; i++) {
        a[i][0] = ((i == 0) ? a[0][0] : a[i - (i & -i)][0] + 1);
        for (j = 1; j < min(i + 1, (1 << n) - i); j++)
            a[i][j] = a[i][j - (j & -j)] - 1;
    }
    for (i = 0; i < 1 << (n - 1); i++)
        for (j = i + 1; j < (1 << n) - i; j++)
            a[i][j] = 2 * a[0][0] - a[j][i];
    for (i = 1; i < 1 << n; i++)
        for (j = (1 << n) - i; j < 1 << n; j++)
            a[i][j] = a[(1 << n) - j - 1][(1 << n) - i - 1];
    for (i = 1; i < (1 << n) - 1; i++)
        for (i = 0; i < 1 << n; i++) {
            for (j = 0; j < 1 << n; j++)
                cout << ((a[i][j] < 0) ? " " : "  ") << a[i][j];
            cout << "\n";
        }
}