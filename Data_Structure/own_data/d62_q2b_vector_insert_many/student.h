#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>

template <typename T>
void CP::vector<T>::insert_many(CP::vector<std::pair<int, T>> data) {
    // write your code here
    std::sort(data.begin(), data.end());
    vector<int> t = *this;
    mSize = 0;
    auto it = data.begin();
    for (int i = 0; i < t.size(); i++) {
        if (it->first == i) {
            push_back(it->second);
            it++;
        }
        push_back(t[i]);
    }
    if (it != data.end())
        push_back(it->second);
}

#endif
