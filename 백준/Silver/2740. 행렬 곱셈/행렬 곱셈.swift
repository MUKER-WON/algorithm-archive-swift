let NM = readLine()!.split { $0 == " "}.map { Int($0)! }, N = NM[0], M = NM[1]
var A = [[Int]]()
for _ in 0..<N {
    A.append(readLine()!.split { $0 == " "}.map { Int($0)! })
}
let MK = readLine()!.split { $0 == " "}.map { Int($0)! }, K = MK[1]
var B = [[Int]]()
for _ in 0..<M {
    B.append(readLine()!.split { $0 == " "}.map { Int($0)! })
}

for i in 0..<N {
    var arr = [Int]()
    for j in 0..<K {
        var sum = 0
        for k in 0..<M {
            sum += A[i][k] * B[k][j]
        }
        arr.append(sum)
    }
    arr.forEach { print($0, terminator: " ") }
    print("")
}