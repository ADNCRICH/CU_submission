#include <bits/stdc++.h>
using namespace std;
map<string, int> mp;
string s;
int main() {
    int n, i, ma = -10;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> s;
        mp[s]++;
    }
    for (auto it = mp.begin(); it != mp.end(); it++)
        if ((*it).second >= ma)
            s = (*it).first, ma = (*it).second;
    cout << s << " " << ma;
}