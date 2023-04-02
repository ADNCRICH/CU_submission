#include <bits/stdc++.h>
using namespace std;
struct A {
    int u, v, w;
};
int a[110], aaa[110];
vector<A> g;
int main() {
    int n, e, s, i, j, aa, bb, w, ch = 1;
    cin >> n >> e >> s;
    memset(a, 0x3f, sizeof a);
    for (i = 0; i < e; i++) {
        cin >> aa >> bb >> w;
        g.push_back({aa, bb, w});
    }
    a[s] = 0;
    for (i = 0; i < n; i++)
        for (j = 0; j < e; j++) {
            A t = g[j];
            if (a[t.u] + t.w < a[t.v])
                a[t.v] = a[t.u] + t.w;
        }
    for (i = 0; i < n; i++)
        aaa[i] = a[i];
    for (j = 0; j < e; j++) {
        A t = g[j];
        if (a[t.u] + t.w < a[t.v])
            a[t.v] = a[t.u] + t.w;
    }
    for (i = 0; i < n; i++)
        if (a[i] != aaa[i])
            ch = 0;
    if (!ch) {
        cout << -1;
        return 0;
    }
    for (i = 0; i < n; i++)
        cout << a[i] << " ";

    return 0;
}
