#include <iostream>
#include <vector>
using namespace std;
void cross_2d(vector<vector<int>> &m, int r1, int r2, int c1, int c2) {
    // your code here
    vector<vector<int>> t;
    int now = 0;
    for (int i = 0; i < m.size(); i++) {
        if (r1 <= i && i <= r2) continue;
        t.push_back(vector<int>());
        for (int j = 0; j < m[0].size(); j++) {
            if (c1 <= j && j <= c2) continue;
            t[now].push_back(m[i][j]);
        }
        now++;
    }
    m = t;
}
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    vector<vector<int>> m;
    int r, c, r1, r2, c1, c2;
    cin >> r >> c;
    cin >> r1 >> r2 >> c1 >> c2;
    m.resize(r);
    for (int i = 0; i < r; i++) {
        m[i].resize(c);
        for (int j = 0; j < c; j++) {
            cin >> m[i][j];
        }
    }
    cross_2d(m, r1, r2, c1, c2);
    for (int i = 0; i < m.size(); i++) {
        for (int j = 0; j < m[i].size(); j++) {
            cout << m[i][j] << " ";
        }
        cout << "\n";
    }
    return 0;
}
/*
4 6
1 2 0 1
1 2 3 4 5 6
11 12 13 14 15 16
21 22 23 24 25 26
31 32 33 34 35 36
*/