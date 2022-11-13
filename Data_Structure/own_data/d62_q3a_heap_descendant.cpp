#include <bits/stdc++.h>
using namespace std;
int n, a, cnt;
vector<int> ans;
queue<int> q;
int main() {
    ios_base::sync_with_stdio(false), cin.tie(0);
    int i;
    cin >> n >> a;
    q.push(a);
    while (!q.empty()) {
        int t = q.front();
        q.pop();
        ans.push_back(t);
        if (2 * t + 1 < n) q.push(2 * t + 1);
        if (2 * t + 2 < n) q.push(2 * t + 2);
    }
    cout << ans.size() << "\n";
    for (i = 0; i < ans.size(); i++)
        cout << ans[i] << " ";
}