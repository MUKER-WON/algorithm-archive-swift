var S = ""
for i in readLine()! {
    if 65...90 ~= i.asciiValue! {
        S += i.lowercased()
    } else {
        S += i.uppercased()
    }
}
print(S)