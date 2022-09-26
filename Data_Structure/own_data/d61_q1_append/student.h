#include "queue.h"
#include "stack.h"

namespace CP {
template <typename T>
void stack<T>::appendStack(stack<T> s) {
    ensureCapacity(mSize + s.mSize);
    for (int i = mSize - 1; i >= 0; i--)
        mData[i + s.mSize] = mData[i];
    for (int i = 0; i < s.mSize; i++)
        mData[i] = s.mData[i];
    mSize += s.mSize;
}

template <typename T>
void stack<T>::appendQueue(queue<T> q) {
    ensureCapacity(mSize + q.mSize);
    for (int i = mSize - 1; i >= 0; i--)
        mData[i + q.mSize] = mData[i];
    for (int i = q.mSize - 1, j = 0; i >= 0; i--, j++)
        mData[j] = q.mData[(q.mFront + i) % mCap];
    mSize += q.mSize;
}

template <typename T>
void queue<T>::appendStack(stack<T> s) {
    ensureCapacity(mSize + s.mSize);
    for (int i = s.mSize - 1; i >= 0; i--)
        push(s.mData[i]);
}

template <typename T>
void queue<T>::appendQueue(queue<T> q) {
    for (int i = 0; i < q.mSize; i++)
        push(q.mData[(mFront + i) % mCap]);
}
}  // namespace CP
