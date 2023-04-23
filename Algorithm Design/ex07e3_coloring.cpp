#include <bits/stdc++.h>
using namespace std;
int n, e, a[60], mk[60];
vector<int> g[60];
bool play(int st, int ma) {
    if (st == n) return true;
    bool ch = false;
    int aa[60];
    memset(aa, 0, sizeof aa);
    for (auto x : g[st]) {
        if (mk[x])
            aa[a[x]] = 1;
    }
    for (int i = 0; i < ma; i++) {
        if (aa[i]) continue;
        mk[st] = 1;
        a[st] = i;
        if (play(st + 1, ma)) {
            mk[st] = 0;
            return true;
        }
    }
    return ch;
}
int main() {
    int aa, bb;
    cin >> n >> e;
    for (int i = 0; i < e; i++) {
        cin >> aa >> bb;
        g[aa].push_back(bb);
        g[bb].push_back(aa);
    }
    for (int i = 1; i <= n; i++) {
        if (play(0, i)) {
            cout << i;
            break;
        }
    }
    return 0;
}
/*
4 6
0 1
0 2
0 3
1 2
1 3
2 3

*/