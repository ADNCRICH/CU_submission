#include <bits/stdc++.h>
using namespace std;
int a[110][110], aaa[110][110];
int main() {
    int n, e, s, i, j, k, aa, bb, w, ch = 1;
    cin >> n >> e >> s;
    memset(a, 0x3f, sizeof a);
    for (i = 0; i < e; i++) {
        cin >> aa >> bb >> w;
        a[aa][bb] = min(a[aa][bb], w);
    }
    for (i = 0; i < n; i++)
        a[i][i] = 0;
    for (k = 0; k < n; k++)
        for (i = 0; i < n; i++)
            for (j = 0; j < n; j++)
                a[i][j] = min(a[i][j], a[i][k] + a[k][j]);
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            aaa[i][j] = a[i][j];
    for (k = 0; k < n; k++)
        for (i = 0; i < n; i++)
            for (j = 0; j < n; j++)
                a[i][j] = min(a[i][j], a[i][k] + a[k][j]);
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            if (a[i][j] != aaa[i][j]) ch = 0;
    if (!ch) {
        cout << -1;
        return 0;
    }
    for (i = 0; i < n; i++)
        cout << ((aaa[s][i] > 1e9) ? 0 : aaa[s][i]) << " ";
    return 0;
}
