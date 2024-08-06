let NM = readLine()!.split(separator:  " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var arr = Array(1...N)
for _ in 0..<M {
    let i = readLine()!.split(separator: " ").map { Int($0)!-1 }
    let b = i[0], m = i[2], e = i[1]
    let nums = arr[m...e]
    arr.removeSubrange(m...e)
    arr.insert(contentsOf: nums, at: b)
}
arr.forEach { print($0,terminator: " ") }