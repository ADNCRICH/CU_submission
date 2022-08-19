#include <bits/stdc++.h>
using namespace std;
map<int, int> mp;
int main() {
    mp[5] = 3;
    mp[7] = -1;
    for (auto it = mp.begin(); it != mp.end(); it++)
        cout << (*it).second;
}
