#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
void CP::vector<T>::insert(iterator position, iterator first, iterator last) {
    // write your code here
    auto t = *this;
    mSize = 0;
    for (int i = 0; i <= t.size(); i++) {
        if (begin() + i == position)
            for (auto it = first; it < last; it++)
                push_back(*it);
        if (i < t.size())
            push_back(t[i]);
    }
}

#endif
