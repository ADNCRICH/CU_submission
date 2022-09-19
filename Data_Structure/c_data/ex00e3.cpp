#include <bits/stdc++.h>
using namespace std;
vector<int> v;
int main() {
    int n, k, i;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> k;
        v.push_back(k);
    }
    sort(v.begin(), v.end());
    v.resize(unique(v.begin(), v.end()) - v.begin());
    if (v.size() == n && v[0] == 1 && v.back() == n)
        cout << "YES\n";
    else
        cout << "NO\n";
}