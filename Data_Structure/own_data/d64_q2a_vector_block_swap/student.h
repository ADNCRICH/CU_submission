#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
bool CP::vector<T>::block_swap(iterator a, iterator b, size_t m) {
    // write your code here
    if (a > b)
        std::swap(a, b);
    int aa = a - begin(), bb = b - begin();
    if (m == 0 || aa + m - 1 >= bb || bb + m - 1 >= mSize || aa < 0)
        return false;
    for (int i = 0; i < m; i++)
        std::swap(*(a + i), *(b + i));
    return true;
}

#endif
