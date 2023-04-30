#include <bits/stdc++.h>
using namespace std;
int a[100100], dd;
int main() {
    int i, n, m, l = 0, r, mid;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> a[i];
        if (i > 0)
            l = max(a[i] - a[i - 1], l);
        else
            l = a[0];
    }
    r = a[n - 1], mid;
    cout << l << " " << r << "\n";
    while (l < r) {
        mid = (l + r) / 2;
        int now = mid, d = 0;
        for (i = 0; i < n; i++)
            if (now < a[i] || i == n - 1)
                now = a[i - 1] + mid, d++;
        if (d <= m) {
            dd = d;
            r = mid;
        } else
            l = mid + 1;
    }
    cout << r << " " << dd;
    return 0;
}
