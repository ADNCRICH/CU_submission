#include <bits/stdc++.h>

#include "CP_Pair.h"
#include "CP_Vector.h"

using namespace std;
int main() {
    // CP::pair<int, string> a;
    // a.first = 5, a.second = "sefefg";
    // cout << a.first << " " << a.second << "\n";
    // CP::pair<int, string> b;
    // b = a;
    // cout << b.first << " " << b.second << "\n";
    // CP::pair<int, string> c(5, "thxdy");
    // cout << (a < b) << " " << (a < c) << " " << (a == b) << " " << (a != b) << (a != c) << " " << (a >= b) << "\n";

    // CP::pair<int, string> a(5, "rgrsrrg");
    // CP::pair<int, string> b(a);
    // a.second = "ggg";
    // cout << b.first << " " << b.second;

    // int n = 5;
    // size_t m = 5;
    // int a[5];
    // for (int i = 0; i < n; i++)
    //     a[i] = i;
    // cout << a[n - 3] << " " << a[m - 3];
    int a = 5, b = 10;
    cout << std::less<int>{}(b, a);
}