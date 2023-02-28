#include <bits/stdc++.h>
using namespace std;
int m[50], x;
char play(int l, int r, int st) {
    if (st == 0)
        return ((l == x) ? 'g' : 'a');
    if (x < l + m[st - 1])
        return play(l, l + m[st - 1] - 1, st - 1);
    if (x < l + m[st - 1] + st + 3)
        return play(l + m[st - 1], l + m[st - 1] + st + 2, 0);
    else
        return play(l + m[st - 1] + st + 3, r, st - 1);
}
int main() {
    int n = 0;
    cin >> x;
    m[0] = 3;
    while (m[n] < x) {
        n++;
        m[n] = 2 * m[n - 1] + n + 3;
    }
    cout << play(1, m[n], n);
}