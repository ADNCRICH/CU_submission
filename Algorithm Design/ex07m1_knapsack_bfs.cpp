#include <bits/stdc++.h>
using namespace std;
double W, mx;
int n;
struct AA {
    double v, w;
    bool operator<(const AA &o) const {
        return v / w > o.v / o.w;
    }
};
AA a[110];
struct A {
    int st;
    double w, v;
    double dis(const A &o) const {
        double val = v, ww = w;
        for (int i = st; i < n; i++)
            if (ww + a[i].w <= W)
                val += a[i].v, ww += a[i].w;
            else {
                val += a[i].v / a[i].w * (W - ww);
                break;
            }
        return val;
    }
    bool operator<(const A &o) const {
        return dis(*this) < dis(o);
    }
};
priority_queue<A> pq;
int main() {
    cin.tie(0)->sync_with_stdio(false);
    cout << fixed << setprecision(4);
    cin >> W >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i].v;
    for (int i = 0; i < n; i++)
        cin >> a[i].w;
    sort(a, a + n);
    pq.push({0, 0, 0});
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (t.st == n) {
            mx = max(mx, t.v);
            continue;
        }
        if (t.dis(t) <= mx) continue;
        if (t.w + a[t.st].w <= W)
            pq.push({t.st + 1, t.w + a[t.st].w, t.v + a[t.st].v});
        pq.push({t.st + 1, t.w, t.v});
    }
    cout << mx;
    return 0;
}
