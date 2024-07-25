let n = Int(readLine()!)!
var arr = Array(repeating: " ", count: n)

for i in (0..<n).reversed() {
    arr[i] = "*"
    print(arr.joined())
}

for i in 0..<n {
    arr[i] = " "
    print(arr.joined())
}