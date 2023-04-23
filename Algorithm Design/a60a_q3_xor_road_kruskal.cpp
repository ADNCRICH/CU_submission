#include <bits/stdc++.h>
using namespace std;
long long a[2020], p[2020], cou;
long long fp(long long i) {
    if (p[i] == i) return i;
    return p[i] = fp(p[i]);
}
struct A {
    long long u, v, w;
    bool operator<(const A& o) const {
        return w < o.w;
    }
};
priority_queue<A> pq;
int main() {
    long long n, aa, i, j;
    cin >> n;
    for (i = 0; i < n; i++)
        cin >> a[i];
    for (i = 0; i < n; i++)
        for (j = i + 1; j < n; j++)
            pq.push({i, j, a[i] ^ a[j]});
    for (i = 0; i < n; i++)
        p[i] = i;
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (fp(t.u) == fp(t.v)) continue;
        p[fp(t.u)] = fp(t.v);
        cou += t.w;
    }
    cout << cou;
    return 0;
}
