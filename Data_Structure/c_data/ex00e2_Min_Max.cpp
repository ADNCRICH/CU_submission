#include <bits/stdc++.h>
using namespace std;
int n, m, ma = -1e9;
int main() {
    int x1, x2, y1, y2, i, j, q, xx1, xx2, yy1, yy2;
    scanf("%d %d %d", &n, &m, &q);
    vector<vector<int>> a(n + 1, vector<int>(m + 1));
    for (i = 1; i <= n; i++)
        for (j = 1; j <= m; j++)
            scanf("%d", &a[i][j]);
    while (q--) {
        scanf("%d %d %d %d", &xx1, &yy1, &xx2, &yy2);
        ma = -1e9;
        if (xx1 > xx2 || yy1 > yy2) {
            printf("INVALID\n");
            continue;
        }
        if (xx1 > n || xx1 < 1 || yy1 > m || yy2 < 1) {
            printf("OUTSIDE\n");
            continue;
        }
        for (i = max(1, xx1); i <= min(n, xx2); i++)
            for (j = max(1, yy1); j <= min(m, yy2); j++)
                ma = max(ma, a[i][j]);
        printf("%d\n", ma);
    }
}