let KN = readLine()!.split(separator: " ").map { Int($0)! }
let arr = (0..<KN[0]).map { _ in Int(readLine()!)! }
var left = 1
var right = arr.max()!
while left <= right {
    var count = 0
    let mid = (left + right) / 2
    for i in arr { count += (i / mid) }
    if count < KN[1] { right = mid - 1 }
    else { left = mid + 1 }
}
print(right)
