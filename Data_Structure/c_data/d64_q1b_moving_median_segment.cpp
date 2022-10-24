#include <bits/stdc++.h>
using namespace std;
#define N 16  // 1000017
int a[N * 4 + 50];
vector<int> v(1000100);
void upd(int l, int r, int k, int idx, int val) {
    if (r < k || k < l) return;
    if (l == r) {
        a[idx] += val;
        return;
    }
    int mid = (l + r) / 2;
    upd(l, mid, k, idx * 2, val);
    upd(mid + 1, r, k, idx * 2 + 1, val);
    a[idx] = a[idx * 2] + a[idx * 2 + 1];
}
int qr(int l, int r, int ll, int rr, int idx) {
    if (r < ll || l > rr) return 0;
    if (l >= ll && r <= rr) return a[idx];
    if (l == r) return a[idx];
    int mid = (l + r) / 2;
    return qr(l, mid, ll, rr, idx * 2) + qr(mid + 1, r, ll, rr, idx * 2 + 1);
}
int main() {
    int n, w, m, i;
    cin >> n >> w;
    for (i = 0; i < w; i++) {
        cin >> v[i];
        upd(1, N, v[i], 1, 1);
        for (int j = 1; j < 32; j++)
            cout << a[j] << " ";
        cout << "\n";
    }
    for (i = w; i < n; i++) {
        cin >> v[i];
        upd(1, N, v[i], 1, 1);
        int l = 1, r = N, mid;
        while (l != r) {
            mid = (l + r + 1) / 2;
            if (qr(1, N, 1, mid, 1) <= (w / 2 + 1))
                l = mid;
            else
                r = mid - 1;
        }
        cout << l << "\n";
        upd(1, N, v[i - w], 1, -1);
        for (int j = 1; j < 32; j++)
            cout << a[j] << " ";
        cout << "\n";
    }
    for (int j = 1; j < 32; j++)
        cout << a[j] << " ";
    cout << "\n";
}