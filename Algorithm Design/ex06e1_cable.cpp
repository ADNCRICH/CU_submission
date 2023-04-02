#include <bits/stdc++.h>
using namespace std;
int p[1010];
int fp(int i) {
    if (p[i] == i)
        return i;
    return p[i] = fp(p[i]);
}
struct A {
    int u, v, w;
    bool operator<(const A& o) const {
        return w > o.w;
    }
};
int main() {
    int return 0;
}
