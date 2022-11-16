void replace(const T& x, list<T>& y) {
    // write your code here
    CP::list<T>::iterator it = begin(), it2;
    while (it != end()) {
        if (*it == x) {
            it = erase(it);
            it2 = y.begin();
            while (it2 != y.end()) {
                it = insert(it, *(it2++));
                it++;
            }
        } else
            it++;
    }
}
