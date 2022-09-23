#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
void CP::vector<T>::mirror() {
    // write your code here
    int s = size();
    ensureCapacity(s * 2);
    mSize = 2*s;
    for (int i = 0; i < s; i++)
        mData[mSize - i - 1] = mData[i];
}

#endif
