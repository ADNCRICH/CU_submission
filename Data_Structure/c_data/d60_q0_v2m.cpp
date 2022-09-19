#include <stdio.h>
#include <stdlib.h>

#include <iostream>
#include <map>
#include <vector>
using namespace std;
map<int, string> vector_to_map(vector<pair<int, string>>::iterator start, vector<pair<int, string>>::iterator end) {
    // write your code here
    // you need to declare a map here
    // do not forget to return the map
    map<int, string> mp;
    for (auto i = start; i != end; i++) {
        if (mp.find(i->first) == mp.end())
            mp[i->first] = i->second;
    }
    return mp;
}
int main() {
    int n, a, b;
    cin >> n >> a >> b;
    vector<pair<int, string>> v(n);
    for (int i = 0; i < n; i++) {
        cin >> v[i].first;
    }
    for (int i = 0; i < n; i++) {
        cin >> v[i].second;
    }
    map<int, string> m;
    m = vector_to_map(v.begin() + a, v.begin() + b);
    cout << "-------- result -----------" << endl;
    cout << "Size of map = " << m.size() << endl;
    for (auto &x : m) {
        cout << "(" << x.first << "," << x.second << ")" << endl;
    }
}