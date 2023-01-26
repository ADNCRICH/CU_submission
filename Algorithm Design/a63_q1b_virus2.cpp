#include <bits/stdc++.h>
using namespace std;
int a[33000];
pair<int, bool> play(int l, int r) {
    if (l == r)
        return {a[l], true};
    pair<int, bool> aa, bb;
    aa = play(l, (l + r) / 2);
    bb = play((l + r + 1) / 2, r);
    if (abs(aa.first - bb.first) <= 1 && aa.second && bb.second)
        return {aa.first + bb.first, true};
    return {aa.first + bb.first, false};
}
int main() {
    int n, k;
    cin >> n >> k;
    while (n--) {
        for (int i = 1; i <= 1 << k; i++)
            cin >> a[i];
        cout << (play(1, 1 << k).second ? "yes\n" : "no\n");
    }
}