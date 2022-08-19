#include <iostream>
#include <vector>
using namespace std;
void vector_swap(vector<int> &v1, vector<int> &v2, int start1, int end1, int start2, int end2) {
    // vector<int> t1, t2;
    // for (int i = 0, j = 0; i < v1.size() || j < v2.size();) {
    //     bool in1 = (i >= start1 && i <= end1 - 1), in2 = (j >= start2 && j <= end2 - 1);
    //     if (!in1 && i < v1.size()) t1.push_back(v1[i++]);
    //     if (!in2 && j < v2.size()) t2.push_back(v2[j++]);
    //     in1 = (i >= start1 && i <= end1 - 1), in2 = (j >= start2 && j <= end2 - 1);
    //     if (in1 || in2) {
    //         if (i < v1.size()) t2.push_back(v1[i++]);
    //         if (j < v2.size()) t1.push_back(v2[j++]);
    //     }
    //     cout << i << (in1 ? "yes" : "no") << " " << j << (in2 ? "yes" : "no") << "\n";
    // }
    // v1 = t1, v2 = t2;
    vector<int> t1, t2;
    for (int i = 0; i < start1; i++)
        t1.push_back(v1[i]);
    for (int i = 0; i < start2; i++)
        t2.push_back(v2[i]);
    for (int i = start1; i < end1; i++)
        t2.push_back(v1[i]);
    for (int i = start2; i < end2; i++)
        t1.push_back(v2[i]);
    for (int i = end1; i < v1.size(); i++)
        t1.push_back(v1[i]);
    for (int i = end2; i < v2.size(); i++)
        t2.push_back(v2[i]);
    v1 = t1, v2 = t2;
}
int main() {
    // read input
    int n, c;
    vector<int> v1, v2;
    cin >> n;  // number of v1
    for (int i = 0; i < n; i++) {
        cin >> c;
        v1.push_back(c);
    }
    cin >> n;  // number of v2
    for (int i = 0; i < n; i++) {
        cin >> c;
        v2.push_back(c);
    }
    int s1, e1, s2, e2;  // position
    cin >> s1 >> e1 >> s2 >> e2;
    // call the function
    vector_swap(v1, v2, s1, e1, s2, e2);
    // display content of the stack
    cout << "v1 has " << v1.size() << endl;
    for (auto &x : v1) {
        cout << x << " ";
    }
    cout << endl;
    // display content of the stack
    cout << "v2 has " << v2.size() << endl;
    for (auto &x : v2) {
        cout << x << " ";
    }
    cout << endl;
}
/*

5
0 1 2 3 4
5
50 51 52 53 54


*/