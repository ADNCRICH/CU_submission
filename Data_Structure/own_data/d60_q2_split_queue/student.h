#ifndef _CP_STUDENT_QUEUE_INCLUDED_
#define _CP_STUDENT_QUEUE_INCLUDED_

#include <iostream>
#include <stdexcept>
//#pragma once
#include <queue>
#include <vector>

#include "queue.h"

template <typename T>
std::vector<CP::queue<T> > CP::queue<T>::split_queue(int k) {
    std::vector<CP::queue<T> > qs(k);
    // code here
    for (size_t i = 0; i < mSize; i++)
        qs[i % k].push(mData[(mFront + i) % mCap]);
    mSize = 0;
    return qs;
}

#endif
