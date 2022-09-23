#include <stdio.h>
#include <stdlib.h>

#include <iostream>
#include <vector>

#include "vector.h"
// aa
#include "student.h"
//#include "student2.h"

using namespace std;

int main() {
    CP::vector<int> v;
    char c;
    scanf("%c", &c);
    while (c != 'q') {
        if (c == 'a') {
            // add data
            int n;
            scanf("%d", &n);
            for (int i = 0; i < n; i++) {
                int value;
                scanf("%d", &value);
                v.push_back(value);
            }
        } else if (c == 'e') {
            // call erase
            std::vector<int> pos;

            int n;
            scanf("%d", &n);
            for (int i = 0; i < n; i++) {
                int value;
                scanf("%d", &value);
                pos.push_back(value);
            }
            v.erase_many(pos);
        } else if (c == 'p') {
            for (auto &x : v) {
                printf("%d ", x);
            }
            printf("\n");
        }
        scanf("%c", &c);
    }
    return 0;
}
