#include <bits/stdc++.h>
using namespace std;
struct A {
    int i, j, dis;
};
int a[1010][1010], dis[1010][1010], di[4] = {1, 0, -1, 0}, dj[4] = {0, 1, 0, -1}, mi = 1e9;
queue<A> q;
int main() {
    int n, si, sj, i, j, x, y;
    cin >> n >> si >> sj;
    for (i = 1; i <= 1000; i++)
        for (j = 1; j <= 1000; j++)
            dis[i][j] = 1e9;
    for (i = 0; i < n; i++) {
        cin >> x >> y;
        a[x][y] = 1;
    }
    q.push({si, sj, 0});
    dis[si][sj] = 0;
    while (!q.empty()) {
        A t = q.front();
        q.pop();
        if (t.i == 1 || t.j == 1 || t.i == 1000 || t.j == 1000)
            mi = min(mi, t.dis);
        for (int k = 0; k < 4; k++) {
            int ii = t.i + di[k], jj = t.j + dj[k];
            if (ii <= 0 || jj <= 0 || ii > 1000 || jj > 1000) continue;
            if (a[ii][jj] && dis[t.i][t.j] + 1 < dis[ii][jj]) {
                dis[ii][jj] = dis[t.i][t.j] + 1;
                q.push({ii, jj, dis[ii][jj]});
            } else if (!a[ii][jj] && dis[t.i][t.j] < dis[ii][jj]) {
                dis[ii][jj] = dis[t.i][t.j];
                q.push({ii, jj, dis[ii][jj]});
            }
        }
    }
    cout << mi << "\n";

    return 0;
}
/*
7 6 3
6 2
5 2
4 3
2 1
7 3
5 4
6 4

6 6 3
6 2
5 2
4 3
2 1
5 4
6 4
*/
