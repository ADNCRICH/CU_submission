#include <bits/stdc++.h>
using namespace std;
int n, k, a[30];
void play(int state, int s) {
    if (state == n) {
        if (s == k) {
            for (int i = 0; i < n; i++)
                cout << a[i];
            cout << "\n";
        }
        return;
    }
    a[state] = 0;
    play(state + 1, s);
    if (s < k) {
        a[state] = 1;
        play(state + 1, s + 1);
    }
}
int main() {
    cin >> k >> n;
    play(0, 0);
}