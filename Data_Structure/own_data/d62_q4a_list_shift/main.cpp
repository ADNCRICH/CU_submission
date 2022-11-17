#include <stdexcept>
#include <iostream>
#include "list.h"
#include "student.h"
#include <vector>



int main() {
  std::ios_base::sync_with_stdio(false);std::cin.tie(NULL);

  CP::list<int> l;
  int n,k;
  std::cin >> n;
  for (int i = 0;i < n;i++) {
    int x;
    std::cin >> x;
    l.push_back(x);
  }

  std::cin >> k;
  for (int i = 0;i < k;i++) {
    l.shift_left();
    l.check_pointer();
    l.print();
  }


}

