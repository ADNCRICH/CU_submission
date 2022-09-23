#ifndef _CP_PAIR_INCLUDED_
#define _CP_PAIR_INCLUDED_

#include <bits/stdc++.h>
namespace CP {
template <typename T1, typename T2>
class pair {
   public:
    T1 first;
    T2 second;

    pair() : first(), second() {}
    pair(const T1 &a, const T2 &b) : first(a), second(b) {}

    bool operator==(const pair<T1, T2> &other) const {
        return (first == other.first && second == other.second);
    }

    bool operator<(const pair<T1, T2> &other) const {
        return ((first < other.first) || (first == other.first && second < other.second));
    }

    bool operator!=(const pair<T1, T2> &other) const {
        return !(this->operator==(other));
    }

    bool operator>=(const pair<T1, T2> &other) const {
        return !((*this) < other);
    }
};
}  // namespace CP
#endif