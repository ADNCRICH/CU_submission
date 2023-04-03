#include <bits/stdc++.h>
using namespace std;
struct A {
    int i, j, w, st, c;
    bool operator<(const A& o) const {
        return w > o.w;
    }
};
priority_queue<A> pq;
int di[4] = {1, 0, -1, 0}, dj[4] = {0, 1, 0, -1};
int main() {
    int r, c, i, j, aa;
    cin >> r >> c;
    int a[r + 10][c + 10], dis[r + 10][c + 10][3][2];
    for (i = 0; i < r; i++)
        for (j = 0; j < c; j++)
            cin >> a[i][j];
    memset(dis, 0x3f, sizeof dis);
    pq.push({0, 0, 0, 0, 0});
    dis[0][0][0][0] = 0;
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (t.w > dis[t.i][t.j][t.st][t.c]) continue;
        for (int k = 0; k < 4; k++) {
            int ii = t.i + di[k], jj = t.j + dj[k];
            if (ii < 0 || jj < 0 || ii >= r || jj >= c) continue;
            if (t.c == 1) {
                if (dis[ii][jj][t.st][0] > t.w + min(0, a[ii][jj])) {
                    dis[ii][jj][t.st][0] = t.w + min(0, a[ii][jj]);
                    pq.push({ii, jj, dis[ii][jj][t.st][0], t.st, 0});
                }
            } else {
                if (t.st < 2) {
                    if (dis[ii][jj][t.st + 1][1] > t.w) {
                        dis[ii][jj][t.st + 1][1] = t.w;
                        pq.push({ii, jj, t.w, t.st + 1, 1});
                    }
                }
                if (dis[ii][jj][t.st][0] > t.w + a[ii][jj]) {
                    dis[ii][jj][t.st][0] = t.w + a[ii][jj];
                    pq.push({ii, jj, t.w + a[ii][jj], t.st, 0});
                }
            }
        }
    }
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            int mi = 1e9;
            for (int k = 0; k < 3; k++)
                mi = min({mi, dis[i][j][k][0], dis[i][j][k][1]});
            cout << mi << " ";
        }
        cout << "\n";
    }
    return 0;
}
