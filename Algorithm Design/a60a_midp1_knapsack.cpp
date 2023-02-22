#include <bits/stdc++.h>
using namespace std;
int a[550][550], v[550], w[550], ans[550], idx;
void play(int i, int j) {
    if (i <= 0 || j <= 0)
        return;
    if (a[i][j] == a[i - 1][j]) {
        play(i - 1, j);
    } else {
        ans[idx++] = i;
        play(i - 1, j - w[i]);
    }
}
int main() {
    int i, j, n, m;
    cin >> n >> m;
    for (i = 1; i <= n; i++)
        cin >> v[i];
    for (i = 1; i <= n; i++)
        cin >> w[i];
    for (i = 0; i <= n; i++)
        for (j = 0; j <= m; j++)
            cin >> a[i][j];
    play(n, m);
    cout << idx << "\n";
    for (i = 0; i < idx; i++)
        cout << ans[i] << " ";
}