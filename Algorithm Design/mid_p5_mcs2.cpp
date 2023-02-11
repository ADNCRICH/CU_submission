#include <bits/stdc++.h>
using namespace std;
int a[100100];
int main() {
    int n, i, j, k, kk, ma = -1e9, s, maa = -1e9;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> a[i];
        maa = max(maa, a[i]);
    }
    for (i = 0; i < n; i++) {
        s = 0;
        for (j = i; j < i + n; j++) {
            if (s + a[j % n] <= 0) {
                break;
            }
            s += a[j % n];
            ma = max(ma, s);
        }
        for (k = i + 1; k < 2 * n; k++) {
            if (a[k] >= 0 && a[k - 1] < 0) {
                i = k - 1;
                break;
            }
        }
    }
    cout << max(ma, maa);
}