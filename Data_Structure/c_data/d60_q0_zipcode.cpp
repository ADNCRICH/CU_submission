#include <algorithm>
#include <iostream>
#include <map>
#include <string>
#include <vector>
using namespace std;
class Letter {
   public:
    string name;
    string address;
    string province;
    string district;
    int zip;
    bool operator<(const Letter& other) const {
        //**Begin Insert**
        if (zip != other.zip) return zip < other.zip;
        if (address != other.address) return address < other.address;
        if (district != other.district) return district < other.district;
        if (province != other.province) return province < other.province;
        return name < other.name;
        //**End Insert**
    }
};
class ZipInfo {
   public:
    int zip;
    string province;
    string district;
};
void correctZipAndSortLetters(vector<ZipInfo>& zipinfo, vector<Letter>& letters) {
    //**Begin Insert**
    map<pair<string, string>, int> mp;
    for (auto x : zipinfo)
        mp[{x.district, x.province}] = x.zip;
    for (auto& x : letters)
        x.zip = mp[{x.district, x.province}];
    sort(letters.begin(), letters.end());
    //**End Insert**
}
int main() {
    int nzip;
    cin >> nzip;
    vector<ZipInfo> zipinfo;
    for (int i = 0; i < nzip; i++) {
        ZipInfo z;
        cin >> z.zip >> z.district >> z.province;
        zipinfo.push_back(z);
    }
    int n;
    cin >> n;
    vector<Letter> letters;
    for (int i = 0; i < n; i++) {
        Letter l;
        cin >> l.name >> l.address >> l.district >> l.province >> l.zip;
        letters.push_back(l);
    }
    correctZipAndSortLetters(zipinfo, letters);
    for (auto& l : letters) {
        cout << l.name << " " << l.address << " " << l.district << " " << l.province << " " << l.zip << endl;
    }
}
/*

5
10110 Klongtoi Bangkok
10210 Donmueang Bangkok
90110 Klonghoikong Songkra
50160 Jomtong Chiangmai
50170 Chiangdow Chiangmai
7
Nattee 25/30_Building_4_Room_3 Donmueang Bangkok 10500
Nuttapong 30/15_Moo_4 Jomtong Chiangmai 50160
Vishnu 397/2_Apt_3 Klonghoikong Songkra 90110
Napan 30/5_Moo_7 Chiangdow Chiangmai 50150
Vishnan 397/2_Apt_3 Klonghoikong Songkra 90200
Nara 30/5_Moo_7 Chiangdow Chiangmai 50150
Noppon 30/15_Moo_4 Jomtong Chiangmai 50120

*/