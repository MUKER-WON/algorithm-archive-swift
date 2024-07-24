let MN = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [Bool](repeating: true, count: 1000001)
var result = ""
arr[1] = false
for i in 2...1000 where arr[i] == true {
    for j in 2...1000000/i {
        arr[i*j] = false
    }
}

for i in MN[0]...MN[1] {
    if arr[i] {
        result += "\(i)\n"
    }
}
print(result)