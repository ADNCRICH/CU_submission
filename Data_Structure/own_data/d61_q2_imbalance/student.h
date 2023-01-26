// Your code here
KeyT tmp;
int ma = -100;
KeyT getValueOfMostImbalanceNode() {
    // Your code here
    dfs(mRoot);
    return tmp;
}
int dfs(node* n) {
    if (n == NULL) return -1;
    int ll = dfs(n->left);
    int rr = dfs(n->right);
    if (std::abs(ll - rr) >= ma) {
        if (std::abs(ll - rr) == ma) {
            if (mLess(n->data.first, tmp)) {
                tmp = n->data.first;
            }
        } else
            tmp = n->data.first;
        ma = std::abs(ll - rr);
    }
    return 1 + std::max(ll, rr);
}
