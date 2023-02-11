#include <bits/stdc++.h>
using namespace std;
priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> mi;
int main() {
    int n, w, i, s = 0, x, ans = -1e9;
    cin >> n >> w;
    mi.push({0, 0});
    for (i = 0; i < n; i++) {
        cin >> x;
        s += x;
        while (mi.top().second + w <= i) mi.pop();
        ans = max(ans, s - mi.top().first);
        // cout << i << " " << mi.top().first << " " << s << " " << ans << endl;
        mi.push({s, i});
    }
    cout << ans;
}