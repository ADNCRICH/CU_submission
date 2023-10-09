#include <bits/stdc++.h>
using namespace std;
ofstream File("0.txt");
void out(int n) {
    if (n >= 0)
        File << "0000";
    else {
        File << "1111";
        n *= -1;
    }
    File << bitset<4>(n / (100));
    File << bitset<4>(n / (10) % 10);
    File << bitset<4>(n % 10) << "\n";
}
int main() {
    int x, y, n;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < (1 << 8); j++) {
            x = j / 16, y = j % 16;
            if (i == 0) {
                n = x + y;
                out(n);
            } else if (i == 1) {
                n = x - y;
                out(n);
            } else if (i == 2) {
                n = x * y;
                out(n);
            } else {
                n = ((!y) ? 0 : x / y);
                out(n);
            }
        }
    }
    File.close();
    cout << "0.txt created\n";
    return 0;
}