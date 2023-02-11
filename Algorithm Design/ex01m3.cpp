#include <bits/stdc++.h>
using namespace std;
int a[1010];
int main() {
    long long n, q, i, x, l, r, mid, s;
    cin >> n >> q;
    for (i = 0; i < n; i++)
        cin >> a[i];
    while (q--) {
        cin >> x;
        l = 0, r = 1e12;
        while (l != r) {
            mid = (l + r) / 2;
            for (i = 0, s = 0; i < n; i++)
                s += mid / a[i] + 1;
            if (s >= x)
                r = mid;
            else
                l = mid + 1;
        }
        cout << l << "\n";
    }
}