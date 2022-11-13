#include <bits/stdc++.h>
using namespace std;
int main() {
    ios_base::sync_with_stdio(false), cin.tie(0);
    long long n, k, now = 0, cnt = 0, i = 1;
    cin >> n >> k;
    if (k == 1) {
        cout << n - 1;
        return 0;
    }
    while (now < n) {
        now += i;
        i *= k;
        cnt++;
    }
    cout << cnt - 1;
}