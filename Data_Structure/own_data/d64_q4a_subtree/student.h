#ifndef __STUDENT_H__
#define __STUDENT_H__

#include <algorithm>
#include <vector>

#include "map_bst.h"

template <typename KeyT, typename MappedT, typename CompareT>
size_t CP::map_bst<KeyT, MappedT, CompareT>::process(node *n) {
    // write your code here
    if (n == NULL) return 0;
    return 1 + process(n->left) + process(n->right);
}

template <typename KeyT, typename MappedT, typename CompareT>
std::pair<KeyT, MappedT> CP::map_bst<KeyT, MappedT, CompareT>::subtree(map_bst<KeyT, MappedT, CompareT> &left, map_bst<KeyT, MappedT, CompareT> &right) {
    // write your code here
    std::pair<KeyT, MappedT> t;
    if (mRoot == NULL)
        return t;
    t = mRoot->data;
    if (mRoot->left != NULL) {
        mRoot->left->parent = NULL;
        left.mRoot = mRoot->left;
        mRoot->left = NULL;
        left.mSize = process(left.mRoot);
    }
    if (mRoot->right != NULL) {
        mRoot->right->parent = NULL;
        right.mRoot = mRoot->right;
        mRoot->right = NULL;
        right.mSize = process(right.mRoot);
    }
    mSize = 1;
    return t;
}

#endif
