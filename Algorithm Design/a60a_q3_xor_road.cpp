#include <bits/stdc++.h>
using namespace std;
long long a[2020], mk[2020], cou;
struct A {
    long long u, w;
    bool operator<(const A &o) const {
        return w < o.w;
    }
};
priority_queue<A> pq;
int main() {
    long long n, i;
    cin >> n;
    for (i = 0; i < n; i++)
        cin >> a[i];
    mk[0] = 1;
    for (i = 1; i < n; i++)
        pq.push({i, a[0] ^ a[i]});
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (mk[t.u]) continue;
        cou += t.w, mk[t.u] = 1;
        for (i = 0; i < n; i++) {
            if (i == t.u || mk[i]) continue;
            pq.push({i, a[t.u] ^ a[i]});
        }
    }
    cout << cou;
    return 0;
}
