#include <bits/stdc++.h>
using namespace std;
int a[100100];
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, m, i, x, l, r, mid;
    cin >> n >> m;
    for (i = 0; i < n; i++)
        cin >> a[i];
    while (m--) {
        cin >> x;
        l = 0, r = n - 1;
        while (l != r) {
            mid = (l + r + 1) / 2;
            if (a[mid] <= x)
                l = mid;
            else if (a[mid] > x)
                r = mid - 1;
        }
        cout << ((a[l] <= x) ? a[l] : -1) << "\n";
    }
}