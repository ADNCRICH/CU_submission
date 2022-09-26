#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
T CP::queue<T>::operator[](int idx) {
    // write something here
    //
    //  you need to return something
    if (idx >= 0)
        return mData[(mFront + idx) % mCap];
    return mData[(mFront + idx + mSize) % mCap];
}

#endif
