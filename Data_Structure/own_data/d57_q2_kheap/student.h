#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <iostream>

#include "priority_queue.h"

template <typename T, typename Comp>
void CP::priority_queue<T, Comp>::fixUp(size_t idx) {
    T tmp = mData[idx];
    while (idx > 0) {
        size_t p = (idx - 1) / 4;
        if (mLess(tmp, mData[p])) break;
        mData[idx] = mData[p];
        idx = p;
    }
    mData[idx] = tmp;
}

template <typename T, typename Comp>
void CP::priority_queue<T, Comp>::fixDown(size_t idx) {
    T tmp = mData[idx];
    size_t c, i;
    while ((c = 4 * idx + 1) < mSize) {
        i = 4 * idx + 1;
        for (c = 4 * idx + 2; c < 4 * idx + 5; c++)
            if (c < mSize && mLess(mData[i], mData[c]))
                i = c;
        if (mLess(mData[i], tmp)) break;
        mData[idx] = mData[i];
        idx = i;
    }
    mData[idx] = tmp;
}

#endif
