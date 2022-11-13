#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <stdio.h>

#include <iostream>

#include "priority_queue.h"

template <typename T, typename Comp>
bool CP::priority_queue<T, Comp>::find(T k) const {
    for (size_t i = 0; i < mSize; i++)
        if (mData[i] == k)
            return true;
    return false;
    // your code here
}

template <typename T, typename Comp>
int CP::priority_queue<T, Comp>::find_level(T k) const {
    if (!find(k)) return -1;
    size_t mx = 0;
    for (size_t i = 0; i < mSize; i++)
        if (mData[i] == k)
            mx = i;
    int cnt = 0;
    while (mx != 0) {
        mx = (mx - 1) / 2;
        cnt++;
    }
    return cnt;
    // your code here
}

#endif
