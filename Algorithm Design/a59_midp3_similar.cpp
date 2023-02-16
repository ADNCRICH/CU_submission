#include <bits/stdc++.h>
using namespace std;
char a[(1 << 17) + 3], b[(1 << 17) + 3];
bool play(int l, int r, int ll, int rr) {
    if (l == r && ll == rr) return a[l] == b[ll];
    return (play(l, (l + r) / 2, (ll + rr + 1) / 2, rr) && play((l + r + 1) / 2, r, ll, (ll + rr) / 2)) ||
           (play(l, (l + r) / 2, ll, (ll + rr) / 2) && play((l + r + 1) / 2, r, (ll + rr + 1) / 2, rr));
}
int main() {
    cin.tie(0)->sync_with_stdio(0);
    cin.exceptions(cin.failbit);
    cin >> a >> b;
    cout << ((play(0, strlen(a) - 1, 0, strlen(b) - 1)) ? "YES" : "NO");
}