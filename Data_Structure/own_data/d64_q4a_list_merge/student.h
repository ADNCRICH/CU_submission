#ifndef __STUDENT_H_
#define __STUDENT_H_
#include <algorithm>

template <typename T>
void CP::list<T>::merge(CP::list<CP::list<T>> &ls) {
    // write your code here
    auto it = ls.begin();
    for (auto &x : ls) {
        if (x.mSize > 0) {
            x.mHeader->next->prev = mHeader->prev;
            x.mHeader->prev->next = mHeader;

            mHeader->prev->next = x.mHeader->next;
            mHeader->prev = x.mHeader->prev;

            x.mHeader->next = x.mHeader;
            x.mHeader->prev = x.mHeader;

            mSize += x.mSize;
            x.mSize = 0;
        }
    }
}

#endif
