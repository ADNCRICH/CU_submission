#include <bits/stdc++.h>
using namespace std;

const int di[] = {1, 0, -1, 0};
const int dj[] = {0, 1, 0, -1};
const int N = 505;
int a[N][N], d[N][N];
int main() {
    cin.tie(nullptr)->sync_with_stdio(false);
    int r, c, t;
    cin >> r >> c >> t;
    queue<pair<int, int>> q;
    memset(d, -1, sizeof d);
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            cin >> a[i][j];
            if (a[i][j] == 1) q.emplace(i, j), d[i][j] = 0;
        }
    }
    while (!q.empty()) {
        int i, j;
        tie(i, j) = q.front();
        q.pop();
        for (int k = 0; k < 4; k++) {
            int ii = i + di[k], jj = j + dj[k];
            if (ii > r - 1 || jj > c - 1 || ii < 0 || jj < 0) continue;
            if (a[ii][jj] == 2 || d[ii][jj] != -1) continue;
            d[ii][jj] = d[i][j] + 1;
            q.emplace(ii, jj);
        }
    }
    int cnt = 0;
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            cnt += (d[i][j] >= 0 && d[i][j] <= t);
        }
    }
    cout << cnt << "\n";

    return 0;
}
