#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>

template <typename T>
void CP::list<T>::shift_left() {
    // your code here
    node *it1 = mHeader->next, *it2 = mHeader->next->next, *it3 = mHeader->prev;
    it1->prev = mHeader->prev;
    it1->next = mHeader;
    it2->prev = mHeader;
    it3->next = mHeader->next;
    mHeader->next = it2;
    mHeader->prev = it1;
}

#endif
