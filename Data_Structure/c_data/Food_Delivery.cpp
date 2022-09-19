#include <bits/stdc++.h>
using namespace std;
queue<int> q1, q2;
vector<int> p, ans;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, m, i, j, o, a, b, cou = 0, k;
    cin >> n >> m;
    for (i = 0; i < m; i++) {
        cin >> k;
        p.push_back(k);
    }
    for (i = 0; i < n; i++) {
        cin >> o;
        if (o == 1) {
            cin >> a >> b;
            if (a == 1)
                q1.push(b);
            else
                q2.push(b);
        } else {
            int m1 = 1e9, m2 = 1e9;
            if (!q1.empty())
                m1 = q1.front();
            if (!q2.empty())
                m2 = q2.front();
            if (m1 <= m2) {
                cou += m1;
                q1.pop();
            } else {
                cou += m2;
                q2.pop();
            }
            ans.push_back(cou);
        }
    }

    for (i = 0; i < m; i++) {
        int k = lower_bound(ans.begin(), ans.end(), p[i]) - ans.begin() + 1;
        if (k != ans.size() + 1)
            cout << k << " ";
        else
            cout << "-1 ";
    }
}
/*

6 5
13 14 10 100 1
1 1 3
1 1 10
1 1 30
2
2
2

6 3
4 7 12
1 2 9
1 1 4
2
1 1 3
2
2

*/