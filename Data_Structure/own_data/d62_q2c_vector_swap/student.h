#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>

template <typename T>
void CP::vector<T>::swap(CP::vector<T> &other) {
    // your code here
    using std::swap;
    swap(this->mData, other.mData);
    swap(this->mCap, other.mCap);
    swap(this->mSize, other.mSize);
}

#endif
