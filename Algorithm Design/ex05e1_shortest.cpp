#include <bits/stdc++.h>
using namespace std;
int di[4] = {1, 0, -1, 0}, dj[4] = {0, 1, 0, -1}, ma[110][110], dis;
char a[110][110];
struct A {
    int x, y, d;
};
queue<A> q;
int main() {
    int r, c, i, j;
    cin >> r >> c;
    for (i = 1; i <= r; i++)
        for (j = 1; j <= c; j++)
            cin >> a[i][j];
    q.push({1, 1, 0});
    ma[1][1] = 1;
    while (!q.empty()) {
        A t = q.front();
        q.pop();
        if (t.x == r && t.y == c) {
            dis = t.d;
            break;
        }
        for (int k = 0; k < 4; k++) {
            int ii = t.x + di[k], jj = t.y + dj[k];
            if (ii <= 0 || jj <= 0 || ii > r || jj > c)
                continue;
            if (a[ii][jj] == '#' || ma[ii][jj])
                continue;
            q.push({ii, jj, t.d + 1});
            ma[ii][jj] = 1;
        }
    }
    cout << ((dis == 0) ? -1 : dis);
    return 0;
}
