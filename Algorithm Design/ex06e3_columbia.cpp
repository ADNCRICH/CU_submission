#include <bits/stdc++.h>
using namespace std;
struct A {
    int i, j, w;
    bool operator<(const A& o) const {
        return w > o.w;
    }
};
priority_queue<A> pq;
int di[4] = {0, 1, 0, -1}, dj[4] = {1, 0, -1, 0};
int main() {
    int r, c, i, j;
    cin >> r >> c;
    int a[r + 10][c + 10], dis[r + 10][c + 10];
    memset(dis, 0x3f, sizeof dis);
    for (i = 0; i < r; i++)
        for (j = 0; j < c; j++)
            cin >> a[i][j];
    pq.push({0, 0, 0});
    dis[0][0] = 0;
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (t.w > dis[t.i][t.j])
            continue;
        for (int k = 0; k < 4; k++) {
            int ii = t.i + di[k], jj = t.j + dj[k];
            if (ii < 0 || jj < 0 || ii >= r || jj >= c) continue;
            if (t.w + a[ii][jj] < dis[ii][jj]) {
                dis[ii][jj] = t.w + a[ii][jj];
                pq.push({ii, jj, dis[ii][jj]});
            }
        }
    }
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++)
            cout << dis[i][j] << " ";
        cout << "\n";
    }
    return 0;
}
