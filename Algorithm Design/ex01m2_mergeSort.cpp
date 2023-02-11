#include <bits/stdc++.h>
using namespace std;
int a[100100], b[100100], c[100100], ans;
void ms(int l, int r) {
    if (l == r) return;
    int mid = (l + r) / 2, ll = mid - l + 1, rr = r - mid;
    ms(l, mid);
    ms(mid + 1, r);
    for (int i = 0; i < ll; i++)
        b[i] = a[l + i];
    for (int i = 0; i < rr; i++)
        c[i] = a[mid + 1 + i];
    int i1 = 0, i2 = 0;
    while (i1 < ll && i2 < rr) {
        if (b[i1] <= c[i2])
            a[l + i1 + i2] = b[i1], i1++;
        else
            a[l + i1 + i2] = c[i2], i2++, ans += ll - i1;
    }
    while (i1 < ll)
        a[l + i1 + i2] = b[i1], i1++;
    while (i2 < rr)
        a[l + i1 + i2] = c[i2], i2++;
}
int main() {
    int n, x, i, j;
    cin >> n;
    for (i = 0; i < n; i++)
        cin >> a[i];
    ms(0, n - 1);
    cout << ans;
}