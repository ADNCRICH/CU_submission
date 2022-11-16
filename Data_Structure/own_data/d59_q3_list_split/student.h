#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
CP::list<T> CP::list<T>::split(iterator it, size_t pos) {
    // write your code here
    CP::list<T> result;

    if (it.ptr == mHeader) {
        if (pos == 0) {
            std::swap(mHeader, result.mHeader);
            std::swap(mSize, result.mSize);
        }
        return result;
    }

    node *it1 = mHeader, *it2 = it.ptr->prev, *it3 = result.mHeader, *it4 = mHeader->prev;

    it1->prev = it2;
    it2->next = it1;
    it3->prev = it4;
    it3->next = it.ptr;
    it.ptr->prev = it3;
    it4->next = it3;

    result.mSize = mSize - pos;
    mSize = pos;

    return result;
}

#endif
