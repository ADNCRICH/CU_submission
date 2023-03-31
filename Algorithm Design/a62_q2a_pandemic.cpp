#include <bits/stdc++.h>
using namespace std;
struct A {
    int i, j, d;
};
queue<A> q;
int a[550][550], mk[550][550], di[4] = {1, 0, -1, 0}, dj[4] = {0, 1, 0, -1}, cou;
int main() {
    int n, m, t, i, j;
    cin >> n >> m >> t;
    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++) {
            cin >> a[i][j];
            if (a[i][j] == 1) {
                q.push({i, j, 0});
                mk[i][j] = 1;
            }
        }
    while (!q.empty()) {
        A x = q.front();
        q.pop();
        cou++;
        for (int k = 0; k < 4; k++) {
            int ii = x.i + di[k], jj = x.j + dj[k];
            if (x.d == t || ii < 0 || jj < 0 || ii >= n || jj >= m) continue;
            if (a[ii][jj] == 2 || mk[ii][jj]) continue;
            mk[ii][jj] = 1;
            q.push({ii, jj, x.d + 1});
        }
    }

    cout << cou << "\n";
}
