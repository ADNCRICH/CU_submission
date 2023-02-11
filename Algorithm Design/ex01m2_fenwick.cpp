#include <bits/stdc++.h>
using namespace std;
int fw[2001000], a[1001000];
int main() {
    int n, i, j, x, s, ans = 0;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> x;
        x += 1000001;
        for (j = x, s = 0; j > 0; j -= j & -j)
            s += fw[j];
        ans += i - s;
        for (j = x; j <= 2000010; j += j & -j) {
            fw[j]++;
        }
    }
    cout << ans;
}