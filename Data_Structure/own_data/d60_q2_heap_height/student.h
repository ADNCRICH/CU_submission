#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <stdio.h>

#include <iostream>

#include "priority_queue.h"

template <typename T, typename Comp>
int CP::priority_queue<T, Comp>::height() const {
    // write your code here
    int cnt = -1;
    size_t s = mSize;
    while (s != 0)
        s /= 2, cnt++;
    return cnt;
}

#endif
