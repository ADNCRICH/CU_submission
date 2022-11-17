void splitList(list<T>& list1, list<T>& list2) {
    // Add your code here
    iterator it = begin();
    size_t n = (mSize + 1) / 2;
    while (n--)
        it++;
    node *it1 = mHeader->next, *it2 = it.ptr->prev, *it3 = it.ptr, *it4 = mHeader->prev;

    mHeader->next = mHeader;
    mHeader->prev = mHeader;
    if (mSize > 0) {
        it1->prev = list1.mHeader->prev;
        list1.mHeader->prev->next = it1;
        list1.mHeader->prev = it2;
        it2->next = list1.mHeader;
    }
    if (mSize > 1) {
        it3->prev = list2.mHeader->prev;
        list2.mHeader->prev->next = it3;
        it4->next = list2.mHeader;
        list2.mHeader->prev = it4;
    }
    list1.mSize += (mSize + 1) / 2;
    list2.mSize += mSize / 2;
    mSize = 0;
}
