#include <iostream>
#include <stdexcept>

#include "vector.h"
//
#include <vector>

#include "student.h"

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(NULL);

    int n, m;
    CP::vector<int> v;
    CP::vector<std::pair<int, int>> data;
    std::cin >> n;
    v.resize(n);
    for (int i = 0; i < n; i++) {
        std::cin >> v[i];
    }
    std::cin >> m;
    data.resize(m);
    for (int i = 0; i < m; i++) {
        int a, b;
        std::cin >> a >> b;
        data[i] = {a, b};
    }

    v.insert_many(data);
    for (auto &x : v) {
        std::cout << x << " ";
    }
    std::cout << std::endl;
}
