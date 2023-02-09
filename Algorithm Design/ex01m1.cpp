#include <bits/stdc++.h>
using namespace std;
int l, xi, yi;
void play(int xx, int yy, int s, int x, int y) {
    int q = 0;
    if (x >= xx + (1 << (s - 1))) q += 1;
    if (y >= yy + (1 << (s - 1))) q += 2;
    if (s == 1) {
        cout << q << " " << xx << " " << yy << "\n";
        return;
    }
    int xt[4] = {xx + (1 << (s - 1)) - 1, xx + (1 << (s - 1)), xx + (1 << (s - 1)) - 1, xx + (1 << (s - 1))};
    int yt[4] = {yy + (1 << (s - 1)) - 1, yy + (1 << (s - 1)) - 1, yy + (1 << (s - 1)), yy + (1 << (s - 1))};
    xt[q] = x, yt[q] = y;
    cout << q << " " << xx + (1 << (s - 1)) - 1 << " " << yy + (1 << (s - 1)) - 1 << "\n";
    play(xx, yy, s - 1, xt[0], yt[0]);
    play(xx + (1 << (s - 1)), yy, s - 1, xt[1], yt[1]);
    play(xx, yy + (1 << (s - 1)), s - 1, xt[2], yt[2]);
    play(xx + (1 << (s - 1)), yy + (1 << (s - 1)), s - 1, xt[3], yt[3]);
}
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int i = 0;
    cin >> l >> xi >> yi;
    while (l > 1) l /= 2, i++;
    cout << ((1 << 2 * i) - 1) / 3 << "\n";
    play(0, 0, i, xi, yi);
}