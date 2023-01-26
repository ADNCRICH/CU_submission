#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>

template <typename T>
void CP::list<T>::extract(const T& value, iterator a, iterator b, CP::list<T>& output) {
    // write your code here
    iterator it = a, tmp;
    while (it != b) {
        if (*it == value) {
            tmp = (++it)--;
            it.ptr->prev->next = it.ptr->next;
            it.ptr->next->prev = it.ptr->prev;
            it.ptr->next = output.mHeader->next;
            it.ptr->prev = output.mHeader;
            output.mHeader->next->prev = it.ptr;
            output.mHeader->next = it.ptr;
            mSize--, output.mSize++;
            it = tmp;
        } else
            it++;
    }
}

#endif
