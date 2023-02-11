#include <stdint.h>
#include <stdio.h>
char a[257][257], n;
uint16_t i, j, m;
int main() {
    scanf("%d %d", &n, &a[0][0]);
    m = 1 << n;
    for (i = 0; i < m; i++) {
        a[i][0] = ((i == 0) ? a[0][0] : a[i - (i & -i)][0] + 1);
        for (j = 1; j < ((i + 1 < m - i) ? i + 1 : m - i); j++)
            a[i][j] = a[i][j - (j & -j)] - 1;
    }
    for (i = 0; i < 1 << (n - 1); i++)
        for (j = i + 1; j < m - i; j++)
            a[i][j] = a[0][0] - a[j][i] + a[0][0];
    for (i = 1; i < m; i++)
        for (j = m - i; j < m; j++)
            a[i][j] = a[m - j - 1][m - i - 1];
    for (i = 0; i < m; i++) {
        for (j = 0; j < m; j++)
            printf("%d ", a[i][j]);
        printf("\n");
    }
}