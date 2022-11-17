#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>

template <typename T>
typename CP::list<T>::iterator CP::list<T>::reverse(iterator a, iterator b) {
    // write your code here
    node *it1 = a.ptr, *it2 = b.ptr->prev;
    while (!(it1 == it2 || it2->next == it1)) {
        std::swap(it1->data, it2->data);
        it1 = it1->next, it2 = it2->prev;
    }
    return a;
}

#endif
