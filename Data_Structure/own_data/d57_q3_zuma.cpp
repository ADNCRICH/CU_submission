#include <bits/stdc++.h>
using namespace std;
deque<pair<int, int>> q;
int l, ch;
void push(int val, int n) {
    if (ch && val != l) {
        if (!q.empty() && q.back().second >= 3) {
            q.pop_back();
            if (!q.empty())
                l = q.back().first;
            else
                ch = 0;
        } else
            ch = 0;
    }
    if (!q.empty() && q.back().first == val) {
        auto t = q.back();
        q.pop_back();
        q.push_back({t.first, t.second + n});
    } else
        q.push_back({val, n});
}
int main() {
    int n, k, v, i, x;
    cin >> n >> k >> v;
    for (i = 0; i < n; i++) {
        if (i == k)
            push(v, 1), ch = 1, l = v;
        cin >> x;
        push(x, 1);
    }
    if (i == k) push(v, 1);
    push(-1, 1);
    while (q.size() > 1) {
        for (i = 0; i < q.front().second; i++)
            cout << q.front().first << " ";
        q.pop_front();
    }
}