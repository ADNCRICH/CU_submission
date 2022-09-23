#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
bool CP::vector<T>::valid_iterator(CP::vector<T>::iterator it) const {
    // write your code here
    if (&mData[0] <= it && it <= &mData[mSize - 1])
        return true;
    return false;
}

#endif
