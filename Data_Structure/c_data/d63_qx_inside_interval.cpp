#include <bits/stdc++.h>
using namespace std;
vector<int> v;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, m, i, a, b;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> a >> b;
        v.insert(v.end(), {a, b + 1});
    }
    sort(v.begin(), v.end());
    for (i = 0; i < m; i++) {
        cin >> a;
        cout << (upper_bound(v.begin(), v.end(), a) - v.begin()) % 2 << " ";
    }
}