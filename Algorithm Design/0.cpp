#include <bits/stdc++.h>
using namespace std;
priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> mi;
int main() {
    mi.push({-1, 5});
    mi.push({-2, 4});
    cout << mi.top().first << " " << mi.top().second;
}
