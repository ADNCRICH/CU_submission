#ifndef __STUDENT_H__
#define __STUDENT_H__

template <typename T>
std::vector<std::vector<T>> CP::stack<T>::distribute(size_t k) const {
    // write your code here
    std::vector<std::vector<T>> t(k);
    int n = mSize / k, m = mSize % k, now = mSize - 1;
    for (int i = 0; i < k; i++) {
        for (int j = 0; j < n + (i < m); j++)
            t[i].push_back(mData[now--]);
    }
    return t;
}
#endif
