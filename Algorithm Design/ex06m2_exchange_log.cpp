#include <bits/stdc++.h>
#include <math.h>
using namespace std;
double a[550][550], aa[550][550];
int ch;
int main() {
    int q, n, i, j, k;
    cin >> q;
    while (q--) {
        cin >> n;
        for (i = 0; i < n; i++)
            for (j = 0; j < n; j++) {
                cin >> a[i][j];
                a[i][j] = -1 * log10(a[i][j]);
            }
        for (k = 0; k < n; k++)
            for (i = 0; i < n; i++)
                for (j = 0; j < n; j++)
                    a[i][j] = min(a[i][k] + a[k][j], a[i][j]);
        for (i = 0; i < n; i++)
            for (j = 0; j < n; j++)
                aa[i][j] = a[i][j];
        for (k = 0; k < n; k++)
            for (i = 0; i < n; i++)
                for (j = 0; j < n; j++)
                    a[i][j] = min(a[i][k] + a[k][j], a[i][j]);
        ch = 1;

        cout << (ch ? "NO\n" : "YES\n");
    }
    return 0;
}
/*
2
3
1 0.7 1.2
1.1 1 2
0.75 0.7 1
2
1 0.7
1.2 1
*/