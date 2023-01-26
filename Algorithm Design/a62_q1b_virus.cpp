#include <bits/stdc++.h>
using namespace std;
int a[33000];
int div(vector<int> v) {
    if (v.size() == 2) {
        if (v[0] == 0 && v[1] == 1) {
            // cout << "0";
            return 0;
        }
        if (v[0] == 1 && v[1] == 0) {
            // cout << "1";
            return 1;
        }
        // cout << "-1";
        return -1;
    }
    vector<int> vv, vv2;
    for (int i = 0; i < v.size() / 2; i++)
        vv.push_back(v[i]);
    if (vv.back() == 0)
        reverse(vv.begin(), vv.end());
    for (int i = v.size() / 2; i < v.size(); i++)
        vv2.push_back(v[i]);
    int aa = div(vv);
    int bb = div(vv2);
    if (bb == 0 && (aa == 0 || aa == 1))
        return 0;
    return -1;
}
int main() {
    int n, k, ch, x;
    cin >> n >> k;
    vector<int> v;
    for (int i = 0; i < n; i++) {
        ch = 1;
        for (int j = 0; j < 1 << k; j++) {
            cin >> x;
            v.push_back(x);
        }
        // cout << "ans: " << div(v) << "\n";
        cout << ((div(v) == 0) ? "yes\n" : "no\n");
        v.clear();
    }
}