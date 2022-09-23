#ifndef __STUDENT_H_
#define __STUDENT_H_

// you can include any other file here
#include <unordered_map>
// you are allow to use any data structure

template <typename T>
void CP::vector<T>::uniq() {
    // do someting here
    std::unordered_map<T, bool> mp;
    auto t = *this;
    mSize = 0;
    for (int i = 0; i < t.size(); i++) {
        if (!mp[t.mData[i]]) {
            mp[t.mData[i]] = true;
            push_back(t.mData[i]);
        }
    }
}

#endif
