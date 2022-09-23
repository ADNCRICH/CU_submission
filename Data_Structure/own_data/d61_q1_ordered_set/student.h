#include <vector>
using namespace std;
#include <unordered_map>

template <typename T>
vector<T> Union(const vector<T>& A, const vector<T>& B) {
    vector<T> v;
    unordered_map<T, int> mp;
    for (auto x : A) {
        mp[x]++;
        v.push_back(x);
    }
    for (auto x : B) {
        if (mp[x])
            continue;
        v.push_back(x);
    }
    return v;
}

template <typename T>
vector<T> Intersect(const vector<T>& A, const vector<T>& B) {
    vector<T> v;
    unordered_map<T, int> mp;
    for (auto x : B)
        mp[x]++;
    for (auto x : A) {
        if (mp[x])
            v.push_back(x);
    }
    return v;
}
