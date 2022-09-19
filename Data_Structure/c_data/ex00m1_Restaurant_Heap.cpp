#include <bits/stdc++.h>
using namespace std;
struct A {
    int now, t;
    bool operator<(const A& o) const {
        if (now != o.now)
            return now > o.now;
        else
            return t < o.t;
    }
};
priority_queue<A> hp;
A tt;
int main() {
    int n, m, i, k;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> k;
        hp.push({0, k});
    }
    for (i = 0; i < m; i++) {
        tt = hp.top(), hp.pop();
        cout << tt.now << "\n";
        hp.push({tt.now + tt.t, tt.t});
    }
}