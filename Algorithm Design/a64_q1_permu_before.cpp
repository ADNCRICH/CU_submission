#include <bits/stdc++.h>
using namespace std;
int n, a[30], b[30], c[30];
void play(int st) {
    if (st == n) {
        for (int i = 0; i < n; i++)
            cout << a[i] << " ";
        cout << "\n";
        return;
    }
    for (int i = 0; i < n; i++) {
        // cout << i << " " << c[i] << " " << c[b[i]] << "\n";
        if (b[i] == 0 && (b[c[i]] == 1 || c[i] == -1)) {
            a[st] = i;
            b[i] = 1;
            play(st + 1);
            b[i] = 0;
        }
    }
}
int main() {
    int m, x, y;
    cin >> n >> m;
    memset(c, -1, sizeof c);
    for (int i = 0; i < m; i++) {
        cin >> x >> y;
        c[y] = x;
    }
    play(0);
}