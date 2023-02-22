#include <bits/stdc++.h>
using namespace std;
int a[1010][1010];
char x[1010], y[1010], ans[1010];
void play(int i, int j) {
    if (i == -1 || j == -1) return;
    if (a[i][j] == a[i - 1][j])
        play(i - 1, j);
    else if (a[i][j] == a[i][j - 1])
        play(i, j - 1);
    else {
        ans[a[i][j] - 1] = x[i - 1];
        play(i - 1, j - 1);
    }
}
int main() {
    cin.tie(0)->sync_with_stdio(0);
    int n, m, i, j;
    cin >> n >> m;
    cin >> x >> y;
    for (i = 0; i <= n; i++)
        for (j = 0; j <= m; j++)
            cin >> a[i][j];
    play(n, m);
    cout << ans;
}