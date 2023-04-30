#include <bits/stdc++.h>
using namespace std;
struct A {
    int e;
    bool operator<(const A& o) const {
        return e > o.e;
    }
};
int a[100100];
priority_queue<A> pq;
int main() {
    cout << fixed << setprecision(3);
    long long n, m, i, cou = 0;
    cin >> n >> m;
    for (i = 0; i < m; i++)
        cin >> a[i];
    // FILE* fp = fopen("_txt.txt", "r");
    // fscanf(fp, "%d%d", &n, &m);
    // for (i = 0; i < m; i++)
    //     fscanf(fp, "%d", &a[i]);
    sort(a, a + m);
    for (i = 0; i < n; i++) pq.push({0});
    for (i = 0; i < m; i++) {
        A t = pq.top();
        pq.pop();
        cou += t.e + a[i];
        pq.push({t.e + a[i]});
    }
    cout << double(cou) / m;
    return 0;
}
