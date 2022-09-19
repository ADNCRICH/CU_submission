#include <iostream>
#include <vector>
using namespace std;
void remove_even(vector<int> &v, int a, int b) {
    // write your code only in this function
    int i = 0;
    for (i = b - b % 2; i >= a + a % 2; i -= 2) {
        v.erase(v.begin() + i);
    }
}
int main() {
    // read input
    int n, a, b;
    cin >> n;
    vector<int> v;
    for (int i = 0; i < n; i++) {
        int c;
        cin >> c;
        v.push_back(c);
    }
    cin >> a >> b;
    // call function
    remove_even(v, a, b);
    // display content of the vector
    for (auto &x : v) {
        cout << x << " ";
    }
    cout << endl;
}