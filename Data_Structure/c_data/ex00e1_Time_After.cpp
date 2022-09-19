#include <bits/stdc++.h>
using namespace std;
int main() {
    int h, m, t;
    scanf("%d %d %d", &h, &m, &t);
    m += t;
    h = (h + m / 60) % 24;
    m %= 60;
    printf("%02d %02d\n", h, m);
}