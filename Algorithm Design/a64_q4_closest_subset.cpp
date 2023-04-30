#include <bits/stdc++.h>
using namespace std;
int a[110], n, m, k, qs[110], ans = 1e9;
struct A {
    int st, sum, cou;
    int cmp() const {
        int mi = sum + qs[st] - qs[st + m - cou] - k, mx = sum + qs[n - m + cou] - k;
        if (mi > 0) return mi;
        if (mx < 0) return -mx;
        return 0;
    }
    bool operator<(const A& o) const {
        return this->cmp() > o.cmp();
    }
};
int chhh;
priority_queue<A> pq;
int main() {
    cin >> n >> m >> k;
    for (int i = 0; i < n; i++)
        cin >> a[i];
    sort(a, a + n);
    qs[n - 1] = a[n - 1];
    for (int i = n - 2; i >= 0; i--)
        qs[i] = a[i] + qs[i + 1];
    pq.push({0, 0, 0});
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (t.cmp() >= ans) continue;
        if (t.cou == m) {
            ans = min(ans, abs(k - t.sum));
            continue;
        }
        if (t.st == n) continue;
        pq.push({t.st + 1, t.sum, t.cou});
        pq.push({t.st + 1, t.sum + a[t.st], t.cou + 1});
    }
    cout << ans << "\n";
    return 0;
}
