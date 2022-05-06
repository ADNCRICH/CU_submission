#include <bits/stdc++.h>
using namespace std;

pair<string, double> a[100] = {{"fan", 300}, {"com", 1600}}; // file to read

map<string, double> all;
int hr;
double unit, e;
void getttt()
{
    for (int i = 0; i < 2; i++)
    {
        all[a[i].first.c_str()] = a[i].second; // a[i].first.c_str() is name of eeee, a[i].second is watt
    }
}
int main()
{
    getttt();
    for (auto x : all)
    {
        printf("hr per day of %s:", x.first.c_str());
        scanf("%d", &hr);
        all[x.first.c_str()] *= hr;
    }
    printf("Bath per unit: ");
    scanf("%lf", &e);
    for (auto x : all)
    {
        unit += x.second / 1000;
    }
    unit *= 30;
    printf("unit: %.2f\n", unit);
    printf("cost: %.2f\n", unit * e);
}
