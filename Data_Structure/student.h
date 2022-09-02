#ifndef __STUDENT_H__
#define __STUDENT_H__
#include <stack>
#include <vector>

using namespace std;

int eval_postfix(vector<pair<int, int> > v) {
    // WRITE YOUR CODE HERE
    // DON"T FORGET TO RETURN THE RESULT
    stack<int> s;
    for (auto x : v) {
        if (x.first) {
            s.push(x.second);
        } else {
            int b = s.top();
            s.pop();
            int a = s.top();
            s.pop();
            if (x.second == 0)
                s.push(a + b);
            else if (x.second == 1)
                s.push(a - b);
            else if (x.second == 2)
                s.push(a * b);
            else
                s.push(a / b);
        }
    }
    return s.top();
}

#endif