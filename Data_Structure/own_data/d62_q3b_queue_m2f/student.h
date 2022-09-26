#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <algorithm>
#include <iostream>

template <typename T>
void CP::queue<T>::move_to_front(size_t pos) {
    // your code here
    int p = pos;
    T t = mData[(mFront + p) % mCap];
    // std::cout << "t " << t << "\n";
    for (int i = p - 1; i >= 0; i--)
        mData[(mFront + i + 1) % mCap] = mData[(mFront + i) % mCap];
    mData[(mFront) % mCap] = t;
}

#endif
