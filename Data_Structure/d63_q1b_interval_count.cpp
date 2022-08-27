#include <bits/stdc++.h>
using namespace std;
vector<int> v;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, m, k, i, a;
    cin >> n >> m >> k;
    for (i = 0; i < n; i++) {
        cin >> a;
        v.push_back(a);
    }
    sort(v.begin(), v.end());
    for (i = 0; i < m; i++) {
        cin >> a;
        cout << upper_bound(v.begin(), v.end(), a + k) - lower_bound(v.begin(), v.end(), a - k) << " ";
    }
}