#ifndef __STUDENT_H__
#define __STUDENT_H__

template <typename T>
void CP::stack<T>::moveInsert(int k, CP::stack<T> &s2, int m) {
    // your code here
    if ((int)s2.size() < m) m = s2.size();
    expand(mSize + m);
    for (int i = (int)mSize - 1; i >= (int)mSize - k; i--)
        mData[i + m] = mData[i];
    for (int i = 0; i < m; i++)
        mData[(int)mSize - k + i] = s2.mData[(int)s2.mSize - m + i];
    mSize += m, s2.mSize -= m;
}
#endif
