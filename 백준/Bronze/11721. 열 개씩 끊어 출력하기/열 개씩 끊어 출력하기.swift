let s = readLine()!.map { $0 }
var temp = ""
for i in 0..<s.count {
    if temp.count == 10 {
        print(temp)
        temp = ""
    }
    temp.append(s[i])
}
print(temp)