var hor = [[Int]](), ver = [[Int]]()
for _ in 0..<5 { hor.append(readLine()!.split(separator: " ").map { Int($0)! }) }
for i in 0..<5 {
    var arr = [Int]()
    for j in 0..<5 { arr.append(hor[j][i]) }
    ver.append(arr)
}
ver.append((0..<5).map { hor[$0][$0] })
ver.append((0..<5).map { hor[$0][4-$0] })
var total = hor+ver, count = 1
loop: for _ in 0..<5 {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    for num in nums {
        for i in 0..<total.count { total[i] = total[i].map { $0==num ? 0 : $0 } }
        if total.filter({ $0==[0,0,0,0,0] }).count >= 3 {
            print(count)
            break loop
        }
        count += 1
    }
}