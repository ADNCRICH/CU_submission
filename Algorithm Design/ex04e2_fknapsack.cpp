#include <bits/stdc++.h>
using namespace std;
struct A {
    int v, w;
    bool operator<(const A& o) const {
        return v / w > o.v / o.w;
    }
};
A a[100100];
int main() {
    cout << fixed << setprecision(4);
    return 0;
}
