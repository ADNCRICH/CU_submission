#include <bits/stdc++.h>
#include <windows.h>
using namespace std;
// display 100 * 100 matrix
int W = 40, H = 30;
char a[1000][1000], out[1000][1000];
void ball(int x, int y) {
    int aa[4][4] = {
        {0, 1, 1, 0},
        {1, 1, 1, 1},
        {1, 1, 1, 1},
        {0, 1, 1, 0}};
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            if (aa[i][j])
                a[x + i][y + j] = '#';
}
int main() {
    int aa;
    int ii = 10, jj = 15;
    while (true) {
        // update display
        for (int i = 0; i < H; i++) {
            for (int j = 0; j < W; j++) {
                a[i][j] = '.';
            }
            ball(ii, jj);
        }
        if (GetAsyncKeyState(VK_UP) && ii > 0)
            ii--;
        if (GetAsyncKeyState(VK_DOWN) && ii < H - 4)
            ii++;
        if (GetAsyncKeyState(VK_LEFT) && jj > 0)
            jj--;
        if (GetAsyncKeyState(VK_RIGHT) && jj < W - 4)
            jj++;
        int fac = 1;
        for (int i = 0; i < H; i++) {
            for (int j = 0; j < W + fac * (W - 1); j++)
                if (j % (fac + 1) == 0)
                    out[i][j] = a[i][j / (fac + 1)];
                else
                    out[i][j] = ' ';
        }
        for (int i = 0; i < H; i++) {
            cout << out[i] << "\n";
        }

        // wait 16ms
        Sleep(16);
        // clear display
        system("cls");
    }

    return 0;
}