#include <bits/stdc++.h>
using namespace std;
int n, cou, a[15];
void play(int st) {
    if (st == n) {
        cou++;
        return;
    }
    for (int i = 0; i < n; i++) {
        int ch = 1;
        for (int j = 0; j < st; j++)
            if (a[j] == i || (abs(st - j) == abs(i - a[j])))
                ch = 0;
        if (!ch) continue;
        a[st] = i;
        play(st + 1);
    }
}
int main() {
    cin >> n;
    play(0);
    cout << cou;
    return 0;
}
