#include <bits/stdc++.h>
using namespace std;
map<string, int> mp;
int main() {
    int n;
    string s;
    cin >> n;
    while (n--) {
        cin >> s;
        mp[s]++;
    }
    for (auto x : mp) {
        if (x.second > 1)
            cout << x.first << " " << x.second << "\n";
    }
}