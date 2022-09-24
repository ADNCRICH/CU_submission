#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
int CP::stack<T>::compare_reserve(const CP::stack<T> &other) const {
    // write your code here
    // int a = 1, b = 1;
    // while (a < size()) a *= 2;
    // while (b < other.size()) b *= 2;
    // a = a - size();
    // b = b - other.size();
    int a = mCap - mSize, b = other.mCap - other.mSize;
    return (a < b) ? -1 : (a > b) ? 1
                                  : 0;
}

#endif
