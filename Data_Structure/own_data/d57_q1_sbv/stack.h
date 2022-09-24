#ifndef _CP_STACK_INCLUDED_
#define _CP_STACK_INCLUDED_

#include <iostream>
#include <stdexcept>
#include <vector>
//#pragma once

namespace CP {

template <typename T>
class stack {
   protected:
    std::vector<T> v;

   public:
    //-------------- constructor ----------

    // copy constructor
    stack(const stack<T>& a) {
    }

    // default constructor
    stack() {}

    ~stack() {}

    //------------- capacity function -------------------
    bool empty() const {
        return v.empty();
    }

    //------------ to be implemented by student ----------
    size_t size() const;
    const T& top() const;
    void push(const T& element);
    void pop();
};

}  // namespace CP

#endif
