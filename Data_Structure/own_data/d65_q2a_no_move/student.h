#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>

template <typename T>
T& CP::vector_no_move<T>::operator[](int idx) {
    // your code here
    int i = std::upper_bound(aux.begin(), aux.end(), idx) - aux.begin();
    int j = idx;
    if (i != 0)
        j -= aux[i - 1];
    return mData[i][j];
}

template <typename T>
void CP::vector_no_move<T>::expand_hook() {
    // your code here
    // you MAY need this function
    if (aux.empty()) {
        aux.push_back(mData.back().size());
        return;
    }
    aux.push_back(aux.back() + mData.back().size());
}

#endif
