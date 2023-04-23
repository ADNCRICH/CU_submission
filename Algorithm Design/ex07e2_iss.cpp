#include <bits/stdc++.h>
using namespace std;
int cou, n;
void play(int sum, int l) {
    if (sum == n) {
        cou++;
        return;
    }
    for (int i = l; i <= n - sum; i++) {
        if (n - sum - i != 0 && n - sum - i < i) {
            play(n, n - sum);
            break;
        }
        play(sum + i, i);
    }
}
int main() {
    cin >> n;
    play(0, 1);
    cout << cou;
    return 0;
}
