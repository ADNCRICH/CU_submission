#include <bits/stdc++.h>
using namespace std;
int main() {
    int mFront, mSize, mCap, last, cor, n;
    bool b1, b2, b3, b4, b;
    cin >> n;
    while (n--) {
        cin >> mFront >> mSize >> mCap >> last >> cor;
        if (mCap != 0) {
            b1 = ((mFront < mCap) && (mFront == (last - mSize + mCap) % mCap));
            b2 = ((mSize < mCap) && ((mFront + mSize) % mCap) == last);
            b3 = ((mSize < mCap) && ((mFront + mSize) % mCap) == last);
            b4 = (last == (mFront + mSize) % mCap);
        } else {
            b1 = (mFront == 0);
            b2 = (mSize == 0);
            b4 = (last == 0);
            b3 = (b1 & b2 & b4);
        }
        b = (b1 & b2 & b3 & b4);
        if (cor == 0)
            cout << (b ? "OK" : "WRONG");
        if (cor == 1) {
            if (b)
                cout << "OK";
            else if (mCap != 0)
                cout << "WRONG " << (last - mSize + mCap) % mCap;
            else
                cout << "WRONG 0";
        }
        if (cor == 2) {
            if (b)
                cout << "OK";
            else if (mCap != 0)
                cout << "WRONG " << last - mFront + ((last >= mFront) ? 0 : mCap);
            else
                cout << "WRONG 0";
        }
        if (cor == 3) {
            if (b)
                cout << "OK";
            else
                cout << "WRONG " << ((mFront < last) ? last : mSize + mFront - last);
        }
        if (cor == 4) {
            if (b)
                cout << "OK";
            else if (mCap != 0)
                cout << "WRONG " << (mFront + mSize) % mCap;
            else
                cout << "WRONG 0";
        }
    }
}