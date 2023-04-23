#include <bits/stdc++.h>
using namespace std;
// 15 puzzle
struct A {
    int a[4][4], st = 0, x, y, l;
    int dif(const A &t) const {
        int cou = 0;
        for (int i = 0; i < 4; i++)
            for (int j = 0; j < 4; j++)
                if (t.a[i][j] != 0 && ((t.a[i][j] - 1) / 4 != i || (t.a[i][j] - 1) % 4 != j)) {
                    cou += abs((t.a[i][j] - 1) / 4 - i) + abs((t.a[i][j] - 1) % 4 - j);
                } else if (t.a[i][j] == 0)
                    cou += 6 - i - j;
        return cou;
    }
    bool operator<(const A &o) const {
        return dif(*this) + this->st > dif(o) + o.st;
    }
};

int di[4] = {1, 0, -1, 0}, dj[4] = {0, 1, 0, -1};
// int di[4] = {1, 0, -1, 0}, dj[4] = {0, -1, 0, 1};
priority_queue<A> pq;
int main() {
    cin.tie(0)->sync_with_stdio(0);
    A t;
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++) {
            cin >> t.a[i][j];
            if (t.a[i][j] == 0)
                t.x = i, t.y = j;
        }
    t.l = 10;
    pq.push(t);
    while (!pq.empty()) {
        t = pq.top();
        pq.pop();
        if (t.dif(t) == 0)
            break;
        for (int k = 0; k < 4; k++) {
            A tt = t;
            int ii = t.x + di[k], jj = t.y + dj[k];
            if (ii < 0 || jj < 0 || ii >= 4 || jj >= 4) continue;
            if ((t.l + 2) % 4 == k && t.l != 10) continue;
            swap(tt.a[tt.x][tt.y], tt.a[ii][jj]);
            tt.x = ii, tt.y = jj, tt.st++, tt.l = k;
            pq.push(tt);
        }
    }
    cout << t.st;

    return 0;
}
/*
1 2 3 4
5 6 0 7
9 10 11 8
13 14 15 12

*/