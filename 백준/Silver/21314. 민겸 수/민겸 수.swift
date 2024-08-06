let I = readLine()!.map { $0 == "M" ? true : false }
var C = 0
var ans = ("","")
for i in I {
    if i {
        C += 1
    } else {
        ans.0 += "5" + String(repeating: "0", count: C)
        ans.1 += (C == 0 ? "" : "1" + String(repeating: "0", count: C-1)) + "5"
        C = 0
    }
}
if C > 0 {
    ans.0 += String(repeating: "1", count: C)
    ans.1 += "1" + String(repeating: "0", count: C-1)
}
print("\(ans.0)\n\(ans.1)")