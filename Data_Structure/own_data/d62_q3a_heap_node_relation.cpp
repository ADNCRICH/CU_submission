#include <bits/stdc++.h>
using namespace std;
int main() {
    int a, b, ch, n, m;
    scanf("%d %d", &n, &m);
    while (m--) {
        ch = 0;
        scanf("%d %d", &a, &b);
        if (a == b) {
            printf("a and b are the same node\n");
            continue;
        }
        if (a > b)
            swap(a, b), ch = 1;
        while (a < b)
            b = (b - 1) / 2;
        if (a == b) {
            if (!ch)
                printf("a is an ancestor of b\n");
            else
                printf("b is an ancestor of a\n");
        } else
            printf("a and b are not related\n");
    }
    return 0;
}