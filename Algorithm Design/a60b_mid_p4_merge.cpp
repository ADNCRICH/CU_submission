#include <bits/stdc++.h>
using namespace std;
int a[100100];
bool play(int l, int r, int v) {
    if (v == 1)
        return true;
    if (l == r || v % 2 == 0) return false;
    int mid = (l + r - 1) / 2;
    swap(a[l], a[mid + 1]);
    return play(l, mid, v / 2 - (1 - (v / 2 % 2))) && play(mid + 1, r, v / 2 + (1 - (v / 2 % 2)));
}
int main() {
    int n, k;
    cin >> n >> k;
    for (int i = 1; i <= n; i++)
        a[i] = i;
    if (play(1, n, k) == false)
        cout << "-1";
    else {
        for (int i = 1; i <= n; i++)
            cout << a[i] << " ";
    }
}