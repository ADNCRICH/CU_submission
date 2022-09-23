#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
void CP::vector<T>::erase_many(const std::vector<int> &pos) {
    // write your code here
    std::vector<bool> a(mSize);
    for(auto x:pos)
        a[x]=true;
    vector<T> t;
    for(int i=0;i<mSize;i++){
        if(!a[i])
            t.push_back(mData[i]);
    }
    *this = t;
}

#endif
