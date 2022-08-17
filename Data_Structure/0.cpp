#include <bits/stdc++.h>
using namespace std;
int main() {
    vector<string> v1 = {"somchai", "somying", "somsak"};
    v1[0] = "ergergergerg";
    // range-based for loop
    for (string x : v1) {
        // x is a copy of each element in v1
        cout << x << ", ";
    }
    cout << endl;
    // using reference
    //  x is THE element of v1, meaning we can modify it
    for (auto &x : v1) {
        x.replace(0, 4, "--");
    }
    for (auto &x : v1) {
        cout << x << " ";
    }
    cout << endl;
}
