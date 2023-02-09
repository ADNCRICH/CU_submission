#include <bits/stdc++.h>
using namespace std;
int n, k, t[2][20][270000], a[20];  // you can use vector<int> t[2][20] instead of int t[2][20][270000] but now is 3 a.m.
void play(int s, int l, int r, int m) {
    if (s == 1) {
        t[m][1][0] = a[l] + a[r], t[m][1][1] = a[l] - a[r];
        return;
    }
    play(s - 1, l, (l + r) / 2, 0);
    play(s - 1, (l + r + 1) / 2, r, 1);
    for (int i = 0; i < 1 << (s - 1); i++)
        t[m][s][i] = t[0][s - 1][i] + t[1][s - 1][i];
    for (int i = 0; i < 1 << (s - 1); i++)
        t[m][s][i + (1 << (s - 1))] = t[0][s - 1][i] - t[1][s - 1][i];
    return;
}
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];
    while (n > 1) n /= 2, k++;
    play(k, 0, (1 << k) - 1, 0);
    for (int i = 0; i < 1 << k; i++)
        cout << t[0][k][i] << " ";
}