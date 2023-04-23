def convert_to_dict(data):
    athletes_by_Year_NOC = {}
    key = data[0]
    for i in data[1:]:
        if (i[9] not in athletes_by_Year_NOC):
            athletes_by_Year_NOC[i[9]] = dict()
        if (i[7] not in athletes_by_Year_NOC[i[9]]):
            athletes_by_Year_NOC[i[9]][i[7]] = []
        a = dict()
        for j in range(len(i)):
            a[key[j]] = i[j]
        athletes_by_Year_NOC[i[9]][i[7]].append(a)
    return athletes_by_Year_NOC


# ======================================
def get_medals_by_team(athletes_by_Year_NOC, year):
    medals = {}
    key = ["Gold", "Silver", "Bronze"]
    for i in athletes_by_Year_NOC[year]:
        if i not in medals:
            medals[i] = (0, 0, 0)
        a = list(medals[i])
        for j in athletes_by_Year_NOC[year][i]:
            for k in range(3):
                if j["Medal"] == key[k]:
                    a[k] += 1
        medals[i] = tuple(a)
    return medals


# ======================================
def get_top_five(medals):
    topfive = []
    a = sorted(medals.items(), key=lambda x: {x[1], x[0]})
    for i in a:
        topfive.append(tuple([i[0]]+list(i[1])))
    return topfive


# ======================================
def get_medals_trend(athletes_by_Year_NOC, NOC, start, end):
    trend = []
    ans = dict()
    key = ["Gold", "Silver", "Bronze"]
    for i in athletes_by_Year_NOC:
        if int(i) < start or int(i) > end:
            continue
        if NOC not in athletes_by_Year_NOC[i]:
            continue
        if i not in ans:
            ans[i] = [0, 0, 0]
        for j in athletes_by_Year_NOC[i][NOC]:
            for k in range(3):

                if j["Medal"] == key[k]:
                    ans[i][k] += 1
    for i in ans.items():
        trend.append(tuple([i[0]]+i[1]))
    trend.sort()
    return trend


# ======================================
def get_sports(athletes_by_Year_NOC, NOC, year):
    key = ["Gold", "Silver", "Bronze"]
    sports = set()
    if (year not in athletes_by_Year_NOC) or (NOC not in athletes_by_Year_NOC[year]):
        return set()
    for i in athletes_by_Year_NOC[year][NOC]:
        if (i["Medal"] in key):
            sports.add(i["Sport"])
    return sports


# ======================================
def get_common_sports(athletes_by_Year_NOC, NOCs, year):
    sports = set()
    ch = 1
    for i in NOCs:
        if ch == 1:
            sports = get_sports(athletes_by_Year_NOC, i, year)
            ch = 0
        else:
            sports.intersection_update(get_sports(athletes_by_Year_NOC, i, year))
    return sports
