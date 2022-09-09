#include <bits/stdc++.h>
using namespace std;
#define MAXX 1000000
int a[MAXX * 4 + 7];
void upd(int l, int r, int now, int val, int idx) {
    if (l == r) {
        a[now] += val;
        return;
    }
    int mid = (l + r) / 2;
    if (idx <= mid)
        upd(l, mid, now * 2, val, idx);
    else
        upd(mid + 1, r, now * 2 + 1, val, idx);
    a[now] = a[now * 2] + a[now * 2 + 1];
}
int query(int l, int r, int ll, int rr, int now) {
    if (l > rr || r < ll)
        return 0;
    if (ll > l && rr < r)
        return a[now];
    int mid = (l + r) / 2;
    return query(l, mid, ll, rr, now * 2) + query(mid + 1, r, ll, rr, now * 2 + 1);
}
int main() {
    int n, w, i, k;
    cin >> n >> w;
    for (i = 0; i < w; i++) {
        cin >> k;
        upd(0, MAXX, 1, 1, k);
    }
    for (i = w; i < n; i++) {
        cin >> k;
        upd(0, MAXX, 1, 1, k);
        int l = 1, r = n, mid;
        while (l != r) {
            mid = (l + r) / 2;
            if (query(0, MAXX, 0, mid, 1) >= w / 2 + 1)
                r = mid;
            else
                l = mid + 1;
        }
        cout << l << " ";
        upd(0, MAXX, 1, -1, k);
    }
}