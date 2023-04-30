#include <bits/stdc++.h>
using namespace std;
int n, a[25][25], ma[25], ans = -1e9, mk[25];
struct A {
    int st, now, sum;
    // int ss(const A& t) const {
    //     int cou = t.sum;
    //     for (int i = 0; i < n; i++)
    //         if (!mk[i])
    //             cou += ma[i];
    //     return cou;
    // }
};

void play(A t, int left) {
    if (t.st == n) {
        if (t.now == n - 1)
            ans = max(ans, t.sum);
        return;
    }
    if (t.sum + left <= ans) return;
    for (int i = 0; i < n; i++) {
        if (mk[i]) continue;
        A tt = t;
        tt.st++, tt.now = i, tt.sum += a[t.now][i], mk[i] = 1;
        if (tt.sum + left - ma[i] <= ans) {
            mk[i] = 0;
            continue;
        }
        play(tt, left - ma[i]);
        mk[i] = 0;
    }
}
int main() {
    cin >> n;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            cin >> a[i][j];
            ma[j] = max(ma[j], a[i][j]);
        }
    int couu = 0;
    for (int i = 0; i < n; i++)
        couu += ma[i];
    A t;
    t.st = 1, t.now = 0, t.sum = 0, mk[0] = 1;
    play(t, couu - ma[0]);
    cout << ans << "\n";
    return 0;
}
/*
4
0 1 -1 2
2 0 1 -3
1 15 0 13
3 -1 5 0

4
0 2 1 2
1 0 1 1
1 1 0 1
1 1 1 0
*/