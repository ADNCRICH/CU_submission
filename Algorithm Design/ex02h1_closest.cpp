#include <bits/stdc++.h>
using namespace std;
struct P {
    int x, y, idx;
    int operator-(const P &o) const {
        return (x - o.x) * (x - o.x) + (y - o.y) * (y - o.y);
    }
    int operator-(const int &o) const {
        return abs(x - o);
    }
};
bool cmpX(P &p1, P &p2) {
    return p1.x < p2.x;
}
bool cmpY(P &p1, P &p2) {
    return p1.y < p2.y;
}
P ax[50500], ay[50500];
int ClosestPair(int l, int r) {
    if (r - l == 1) return ax[r] - ax[l];
    if (r - l == 2) return min(ax[l] - ax[l + 1], min(ax[l] - ax[l + 2], ax[l + 1] - ax[l + 2]));
    int d = min(ClosestPair(l, (l + r) / 2), ClosestPair((l + r) / 2 + 1, r));
    int m = (ax[(l + r) / 2].x + ax[(l + r) / 2 + 1].x) / 2;
    int i, j, k = 0;
    for (i = l; i <= r; i++) {
        if (ax[i] - m < d) ay[k++] = ax[i];
    }
    sort(ay, ay + k, cmpY);
    for (i = 0; i < k; i++) {
        for (j = i + 1; j < k && ay[j] - ay[i] < d; j++) {
            d = min(d, ay[i] - ay[j]);
        }
    }
    return d;
}
int main() {
    int n, i, x, y;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> x >> y;
        ax[i] = ay[i] = {x, y, i};
    }
    sort(ax, ax + n, cmpX);
    cout << ClosestPair(0, n - 1);
}