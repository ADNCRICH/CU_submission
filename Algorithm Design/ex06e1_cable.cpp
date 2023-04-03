#include <bits/stdc++.h>
using namespace std;
int p[1010], cou;
int fp(int i) {
    if (p[i] == i)
        return i;
    return p[i] = fp(p[i]);
}
struct A {
    int u, v, w;
    bool operator<(const A& o) const {
        return w > o.w;
    }
};
priority_queue<A> pq;
int main() {
    int n, i, j, aa, bb, w;
    cin >> n;
    for (i = 0; i < n - 1; i++)
        for (j = i + 1; j < n; j++) {
            cin >> w;
            pq.push({i, j, w});
        }
    for (i = 0; i < n; i++)
        p[i] = i;
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (fp(t.u) == fp(t.v)) continue;
        cou += t.w;
        p[fp(t.u)] = fp(p[t.v]);
    }
    cout << cou;
    return 0;
}
