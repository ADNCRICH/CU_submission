a = input()
a = a[10:].split(" ")
ans = []
for i in a:
    name = (i.lower()).replace(".", "")
    if "antivirus" in name or "notvirus" in name:
        pass
    elif "virus" in name or "malware" in name:
        continue
    ans.append(i.replace(",", ""))

print("PC Files: "+", ".join(ans))

# PC Files: viruSgg.exe, antivirus.exe, dog.exe, spotify.viRus, Vi.Rus, notavirus, haloo
