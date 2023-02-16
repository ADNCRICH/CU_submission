#include <bits/stdc++.h>
using namespace std;
int a[100100];
int main() {
    int n, i, j, s, ma = -1e9;
    cin >> n;
    for (i = 0; i < n; i++)
        cin >> a[i];
    for (i = 0; i < n; i = j + 1)
        for (j = i, s = 0; j < n; j++) {
            s += a[j];
            ma = max(ma, s);
            if (s < 0)
                break;
        }
    cout << ma;
}