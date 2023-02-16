#include <bits/stdc++.h>
using namespace std;
priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> mi;
unordered_map<int, unordered_map<int, int>> mp;
unordered_map<int, int> cou;
int a[21000];
int main() {
    mp[0][0] = 1;
    if (mp[0].size() != 0)
        cout << "YES\n";
    else
        cout << "NO\n";
    cou[5] = 1;
    cou[6] = 1;
    cou[17] = 1;
    for (auto x : cou)
        cout << x.first << ' ' << x.second << endl;
}
