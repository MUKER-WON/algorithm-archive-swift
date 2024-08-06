let NM = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(1...NM[0])
for _ in 0..<NM[1] {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    arr.swapAt(ij[0]-1, ij[1]-1)
}
for i in arr {
    print(i,terminator: " ")
}