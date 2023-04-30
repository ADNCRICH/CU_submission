#include <bits/stdc++.h>
using namespace std;
struct A {
    double v, w;
    bool operator<(const A& o) const {
        return v / w > o.v / o.w;
    }
};
A a[100100];
int main() {
    cout << fixed << setprecision(4);
    int n, i;
    double w, now = 0, sum = 0;
    cin >> w >> n;
    for (i = 0; i < n; i++)
        cin >> a[i].v;
    for (i = 0; i < n; i++)
        cin >> a[i].w;
    sort(a, a + n);
    for (i = 0; i < n; i++) {
        if (now + a[i].w < w)
            now += a[i].w, sum += a[i].v;
        else {
            sum += a[i].v / a[i].w * (w - now);
            break;
        }
    }
    cout << sum;
    return 0;
}
