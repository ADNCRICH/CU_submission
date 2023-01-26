#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename KeyT,
          typename MappedT,
          typename CompareT>
CP::map_bst<KeyT, MappedT, CompareT> CP::map_bst<KeyT, MappedT, CompareT>::split(KeyT val) {
    // your code here
    CP::map_bst<KeyT, MappedT, CompareT> result;
    node* now = mRoot;
    while (compare(now->data.first, val) < 0)
        now = now->right;
    std::cout << now->data.first << " " << now->data.second << "\n";
    now->parent->right = NULL;
    now->parent = NULL;
    result.mRoot = now;

    return result;
}

#endif
