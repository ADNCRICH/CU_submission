#include <bits/stdc++.h>
using namespace std;
set<string> s;
vector<int> v;
int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);
    int n, m, l, i, j;
    string k;
    cin >> n >> m >> l;
    for (i = 0; i < l; i++) {
        cin >> j;
        v.push_back(j);
    }
    for (i = 0; i < n; i++) {
        cin >> k;
        s.insert(k);
    }
    for (i = 0; i < m; i++) {
        cin >> k;
        for (j = 0; j < l; j++)
            k[j] = 'a' + (k[j] - 'a' + v[j]) % 26;
        cout << ((s.find(k) != s.end()) ? "Match\n" : "Unknown\n");
    }
}
/*
3 3 6
16 2 18 7 14 14
dclass
passwo
hambwc
nattee
cproom
ryuuio
*/