#include <bits/stdc++.h>
using namespace std;
priority_queue<int, vector<int>, greater<int>> hp;
vector<int> a;
int main() {
    int n, m, i, j, k;
    cin >> n >> m;
    for (i = 0; i < n; i++) {
        cin >> k;
        a.push_back(k);
    }
    int l = 0, r = 1e9, mid, sum;
    while (l != r) {
        mid = (l + r) / 2, sum = 0;
        for (i = 0; i < n; i++)
            sum += (mid / a[i] + 1);
        if (sum >= m)
            r = mid;
        else
            l = mid + 1;
    }
    for (i = 0; i < n; i++) {
        for (j = 0; j <= l; j += a[i])
            hp.push(j);
    }
    while (!hp.empty()) {
        cout << hp.top() << " ";
        hp.pop();
    }
}