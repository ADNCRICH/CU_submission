#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
void CP::vector<T>::erase_many(const std::vector<int> &pos) {
    // write your code here
    std::vector<int> a(mSize);
    int n = 0, now = 0;
    for (auto x : pos) {
        if (!a[x]) n++;
        a[x] = 1;
    }
    for (int i = 0; i < mSize - n; i++) {
        while (a[i + now]) {
            now++;
        }
        mData[i] = mData[i + now];
    }
    mSize -= n;
}

#endif
