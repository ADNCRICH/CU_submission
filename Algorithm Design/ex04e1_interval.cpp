#include <bits/stdc++.h>
using namespace std;
struct A {
    int u, v;
    bool operator<(const A& o) const {
        if (v != o.v)
            return v > o.v;
        return u < o.u;
    }
};
priority_queue<A> pq;
vector<int> uu, vv;
int main() {
    int a, b, n, i, l = -1, cou = 0;
    cin >> n;
    for (i = 0; i < n; i++) {
        cin >> a;
        uu.push_back(a);
    }
    for (i = 0; i < n; i++) {
        cin >> a;
        vv.push_back(a);
    }
    for (i = 0; i < n; i++)
        pq.push({uu[i], vv[i]});
    while (!pq.empty()) {
        A t = pq.top();
        pq.pop();
        if (t.u >= l)
            cou++, l = t.v;
    }
    cout << cou;
    return 0;
}
