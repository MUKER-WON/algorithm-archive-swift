let NM = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(1...NM[0])
for _ in 0..<NM[1] {
    let i = readLine()!.split(separator: " ").map { Int($0)!-1 }
    arr.replaceSubrange(i[0]...i[1], with: arr[i[0]...i[1]].reversed())
}
for i in arr {
    print(i,terminator: " ")
}