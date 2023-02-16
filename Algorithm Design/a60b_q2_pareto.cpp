#include <bits/stdc++.h>
using namespace std;
priority_queue<pair<int, int> > q;
int main() {
    int n, i, a, b, my = -1e9, ans = 0;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> a >> b;
        q.push({a, b});
    }
    while (!q.empty()) {
        pair<int, int> p = q.top();
        q.pop();
        if (p.second > my) {
            ans++;
            my = p.second;
        }
    }
    cout << ans;
}