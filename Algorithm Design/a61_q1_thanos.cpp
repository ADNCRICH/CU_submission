#include <bits/stdc++.h>
using namespace std;
long long a[100100], p, k, A, B;
long long play(long long l, long long r) {
    long long n = upper_bound(a, a + k, r) - lower_bound(a, a + k, l), aa;
    // cout << l << " " << r << " : " << n << "\n";
    if (n == 0)
        return A;
    aa = B * n * (r - l + 1);
    if (l == r)
        return aa;
    long long ll = play(l, (l + r) / 2), rr = play((l + r + 1) / 2, r);
    return min(aa, ll + rr);
}
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    long long i;
    cin >> p >> k >> A >> B;
    for (i = 0; i < k; i++)
        cin >> a[i];
    sort(a, a + k);
    cout << play(1, 1 << p);
}