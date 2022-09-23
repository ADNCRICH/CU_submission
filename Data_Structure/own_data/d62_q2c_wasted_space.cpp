#include <bits/stdc++.h>
using namespace std;
int main() {
    int n, i;
    cin >> n;
    i = 1;
    while (i < n) i *= 2;
    cout << i - n;
}