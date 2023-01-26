#include <bits/stdc++.h>
using namespace std;
int n, k, a[30];
void play(int state, int ma, int l) {
    if (state == n) {
        if (ma >= k) {
            for (int i = 0; i < n; i++)
                cout << a[i];
            cout << "\n";
        }
        return;
    }
    a[state] = 0;
    play(state + 1, ma, 0);
    a[state] = 1;
    play(state + 1, max(ma, l + 1), l + 1);
}
int main() {
    cin >> n >> k;
    play(0, 0, 0);
}