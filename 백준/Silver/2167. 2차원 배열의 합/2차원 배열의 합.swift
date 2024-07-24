let NM = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [[Int]]()
for _ in 0..<NM[0] {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}
for _ in 0..<Int(readLine()!)! {
    let nums = readLine()!.split(separator: " ").map { Int($0)!-1 }
    let i = nums[0], j = nums[1], x = nums[2], y = nums[3]
    print((i...x).map { arr[$0][j...y].reduce(0,+ )}.reduce(0,+))
}