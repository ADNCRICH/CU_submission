#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>

template <typename T>
void CP::vector<T>::rotate(iterator first, iterator last, size_t k) {
    // write your code here

    // sol 1
    // std::rotate(first, first + k, last);

    // sol 2
    T t[k];
    int i, s = first - begin(), l = last - first;
    for (i = 0; i < k; i++) t[i] = mData[s + i];
    for (i = 0; i < l - k; i++) mData[s + i] = mData[s + i + k];
    for (i = l - k; i < l; i++) mData[s + i] = t[i - l + k];
}

#endif
