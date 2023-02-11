#include <bits/stdc++.h>
using namespace std;
int k;
struct A {
    int a, b, c, d;
};
unordered_map<int, A> a;
unordered_map<int, int> mk;
A modd(A x) {
    return {x.a % k, x.b % k, x.c % k, x.d % k};
}
A div(A x, int n) {
    if (n == 1)
        return x;
    if (mk[n])
        return a[n];
    mk[n] = 1;
    A xx = div(x, (n + 1) / 2), yy = div(x, n / 2);

    a[n] = modd({xx.a * yy.a + xx.b * yy.c, xx.a * yy.b + xx.b * yy.d, xx.c * yy.a + xx.d * yy.c, xx.c * yy.b + xx.d * yy.d});
    return a[n];
}
int main() {
    int n, i;
    cin >> n >> k;
    mk[1] = 1;
    cin >> a[1].a >> a[1].b >> a[1].c >> a[1].d;
    div(a[1], n);
    cout << a[n].a << " " << a[n].b << " " << a[n].c << " " << a[n].d;
}