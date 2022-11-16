void shift(int k) {
    // TODO: Add your code here
    int s = mSize;
    k = (k % s + s) % s;
    if (k == 0) return;
    node* it = mHeader;
    while (k--) it = it->next;
    mHeader->next->prev = mHeader->prev;
    mHeader->prev->next = mHeader->next;
    mHeader->prev = it;
    mHeader->next = it->next;
    it->next->prev = mHeader;
    it->next = mHeader;
}
