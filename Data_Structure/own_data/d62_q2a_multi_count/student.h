#ifndef __STUDENT_H_
#define __STUDENT_H_

#include <map>

template <typename T>
std::vector<std::pair<T, size_t>> CP::queue<T>::count_multi(std::vector<T> &k) const {
    // write your code here
    std::vector<std::pair<T, size_t>> t(k.size());
    std::map<T, size_t> mp;
    for (int i = 0; i < mSize; i++)
        mp[mData[(mFront + i) % mCap]]++;
    int now = 0;
    for (auto x : k) {
        size_t cou = mp[x];
        t[now++] = {x, cou};
    }
    return t;
}

#endif
