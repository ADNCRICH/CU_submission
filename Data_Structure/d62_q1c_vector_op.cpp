#include <bits/stdc++.h>
using namespace std;
vector<int> v;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int n, x;
    string o;
    cin >> n;
    while (n--) {
        cin >> o;
        if (o == "pb") {
            cin >> x;
            v.push_back(x);
        } else if (o == "sa") {
            sort(v.begin(), v.end());
        } else if (o == "sd") {
            sort(v.begin(), v.end(), greater<int>());
        } else if (o == "r") {
            for (int i = 0; i < v.size() / 2; i++)
                swap(v[i], v[v.size() - 1 - i]);
        } else if (o == "d") {
            cin >> x;
            v.erase(v.begin() + x);
        }
    }
    for (auto k : v) {
        cout << k << " ";
    }
}