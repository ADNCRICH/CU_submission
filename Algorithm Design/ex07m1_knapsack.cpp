#include <bits/stdc++.h>
using namespace std;
struct A {
    double w, v;
    bool operator<(const A &o) const {
        return v / w > o.v / o.w;
    }
};
A a[110];
double W, ans, qs[110];
int n;
double hue(int st, double ww) {
    double val = 0;
    for (int i = st; i < n; i++) {
        if (ww + a[i].w <= W)
            val += a[i].v, ww += a[i].w;
        else {
            val += a[i].v / a[i].w * (W - ww);
            break;
        }
    }
    return val;
}
void play(int st, double ww, double vv) {
    if (hue(st, ww) + vv <= ans) return;
    if (st == n) {
        ans = max(ans, vv);
        return;
    }
    if (ww + a[st].w <= W)
        play(st + 1, ww + a[st].w, vv + a[st].v);
    play(st + 1, ww, vv);
}
int main() {
    cin.tie(0)->sync_with_stdio(0);
    std::cout << std::fixed << std::setprecision(4);
    cin >> W >> n;
    double vv, ww;
    for (int i = 0; i < n; i++)
        cin >> a[i].v;
    for (int i = 0; i < n; i++)
        cin >> a[i].w;
    sort(a, a + n);
    qs[n - 1] = a[n - 1].v;
    for (int i = n - 2; i >= 0; i--)
        qs[i] = qs[i + 1] + a[i].v;
    play(0, 0, 0);
    cout << ans;
}
