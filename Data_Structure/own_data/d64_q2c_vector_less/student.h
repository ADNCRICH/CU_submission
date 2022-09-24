#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
bool CP::vector<T>::operator<(const CP::vector<T> &other) const {
    // write your code here
    //  if you use std::vector, your score will be half (grader will report score BEFORE halving)
    int s = size(), ss = other.size(), i;
    if (s == 0 && ss > 0)
        return true;
    else if (s > 0 && ss > 0) {
        for (i = 0; i < std::min(s, ss); i++) {
            if (mData[i] < other[i])
                return true;
            if (mData[i] > other[i])
                return false;
        }
        if (i == s && i != ss)
            return true;
    }
    return false;
}

#endif
