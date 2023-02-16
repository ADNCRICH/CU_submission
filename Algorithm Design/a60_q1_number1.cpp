#include <bits/stdc++.h>
using namespace std;
int l, r, idx, ans;
unordered_map<int, int> mk;
void play(int ll, int rr, int n) {
    // cout << ll << " " << rr << " " << n << "\n";
    if (rr < l || ll > r) return;
    if (ll < l || rr > r) {
        play(ll, (ll + rr) / 2 - 1, n / 2);
        play((ll + rr) / 2, (ll + rr + 1) / 2, n % 2);
        play((ll + rr + 1) / 2 + 1, rr, n / 2);
    }
    if (ll >= l && rr <= r)
        ans += n;
}
int main() {
    int n, nn, k = 0;
    cin >> n >> l >> r;
    nn = n;
    while (nn > 0)
        nn /= 2, k++;
    play(1, (1 << k) - 1, n);
    cout << ans;
}