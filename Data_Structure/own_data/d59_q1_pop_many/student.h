#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
void CP::stack<T>::multi_pop(size_t K) {
    // write your code here
    mSize -= std::min(mSize, K);
}

template <typename T>
std::stack<T> CP::stack<T>::remove_top(size_t K) {
    // write your code here
    //
    // don't forget to return an std::stack
    K = std::min(K, mSize);
    std::stack<T> t;
    for (size_t i = 0; i < K; i++)
        t.push(mData[mSize - K + i]);
    multi_pop(K);
    return t;
}

#endif
