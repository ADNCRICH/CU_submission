#include <bits/stdc++.h>
using namespace std;
struct A {
    int i, j, t, p;
};
queue<A> q;
vector<pair<int, int>> pea[1010];
char a[110][110];
int cou, di[4] = {0, 1, 0, -1}, dj[4] = {1, 0, -1, 0};
int main() {
    cin.tie(0)->sync_with_stdio(false);
    int R, C, n, T, r, c, i, j, Q, ti, ri, ci;
    cin >> Q;
    while (Q--) {
        cin >> R >> C >> n >> T >> r >> c;
        for (i = 0; i < n; i++) {
            cin >> ti >> ri >> ci;
            pea[ti].push_back({ri, ci});
        }
        for (i = 0; i < R; i++)
            cin >> a[i];
        q.push({r, c, 0, 0});
        a[r][c] = 'o', cou = 1;
        for (i = 0; i <= T; i++) {
            for (auto x : pea[i]) {
                q.push({x.first, x.second, i, 1});
                if (a[x.first][x.second] == 'o') cou--;
                a[x.first][x.second] = 'x';
            }
            pea[i].clear();
            while (!q.empty()) {
                A tmp = q.front();
                if (tmp.t >= i) break;
                q.pop();
                for (int k = 0; k < 4; k++) {
                    int ii = tmp.i + di[k], jj = tmp.j + dj[k];
                    if (ii < 0 || jj < 0 || ii >= R || jj >= C) continue;
                    if (a[ii][jj] == '#') continue;
                    if (tmp.p == 0) {
                        if (a[ii][jj] == 'x' || a[ii][jj] == 'o') continue;
                        a[ii][jj] = 'o', cou++;
                        q.push({ii, jj, tmp.t + 1, 0});
                    } else {
                        if (a[ii][jj] == 'x' || a[ii][jj] == '#') continue;
                        if (a[ii][jj] == 'o') cou--;
                        a[ii][jj] = 'x';
                        q.push({ii, jj, tmp.t + 1, 1});
                    }
                }
            }
            // cout << cou << "\n";
            if (cou == 0) {
                for (; i <= T; i++) {
                    pea[i].clear();
                }
                break;
            }
        }
        while (!q.empty()) q.pop();
        cout << ((cou > 0) ? "YES\n" : "NO\n");
    }
    return 0;
}
/*
3
2 5 0 1 0 2
.....
.....
2 5 1 1 0 2
1 0 2
.....
.....
2 5 4 1 0 2
1 0 2
1 0 3
1 0 1
1 1 2
.....
.....

*/