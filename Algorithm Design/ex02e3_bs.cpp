#include <bits/stdc++.h>
using namespace std;
int a[100100];
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, q, i, x, l, r, mid;
    cin >> n >> q;
    for (i = 1; i <= n; i++)
        cin >> a[i];
    while (q--) {
        cin >> x;
        l = 0, r = n;
        while (l != r) {
            mid = (l + r + 1) / 2;
            if (a[mid] <= x)
                l = mid;
            else
                r = mid - 1;
        }
        cout << l - 1 << "\n";
    }
}