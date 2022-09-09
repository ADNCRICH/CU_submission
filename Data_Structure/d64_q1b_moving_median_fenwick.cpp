#include <bits/stdc++.h>
using namespace std;
#define maxx 1000000
int fw[1000100];
vector<int> v;
int read(int m) {
    int a = 0;
    for (int i = m; i > 0; i -= i & (-i)) {
        a += fw[i];
    }
    return a;
}
void upd(int m, int c) {
    for (int i = m; i <= maxx; i += i & (-i))
        fw[i] += c;
}
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, w, i, j, k;
    cin >> n >> w;
    for (i = 0; i < w; i++) {
        cin >> k;
        v.push_back(k);
        upd(k, 1);
    }
    for (i = w; i < n; i++) {
        cin >> k;
        v.push_back(k);
        upd(k, 1);
        int l = 0, r = 1000000, mid;
        while (l != r) {
            mid = (l + r) / 2;
            if (read(mid) >= w / 2 + 1)
                r = mid;
            else
                l = mid + 1;
        }
        cout << l << " ";
        upd(v[i - w], -1);
    }
}