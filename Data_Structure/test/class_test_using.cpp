#include <bits/stdc++.h>

#include "class_test.cpp"

int main() {
    CP::list<int> l;
    l.insert(l.end(), 3);
    l.insert(l.end(), 5);
    std::cout << l.back() << "\n";
    CP::list<int>::iterator it = l.begin();
    std::cout << *it << "\n\n";

    CP::list<CP::list<int>> ll;
    CP::list<CP::list<int>>::iterator it2;
    // ll.insert(ll.end(), CP::list<int>());
    ll.insert(ll.end(), l);
    std::cout << ll.begin()->size() << "do\n";

    CP::list<std::vector<int>> lll;
    lll.insert(lll.end(), std::vector<int>());
    std::cout << lll.size() << "\n";
    lll.begin()->push_back(5);
}