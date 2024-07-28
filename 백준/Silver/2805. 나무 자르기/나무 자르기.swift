let NM = readLine()!.split(separator: " ").map { Int($0)! }
let M = NM[1]
let tree = readLine()!.split(separator: " ").map { Int($0)! }
var left = 1
var right = tree.max()!
var result = 0
while left <= right {
    let mid = (left+right) / 2
    var m = 0
    for j in tree { if j > mid { m += j - mid } }
    if M < m { left = mid + 1 }
    else { right = mid - 1 }
}
for i in tree { if i > left { result += i - left } }
result == M ? print(left) : print(right)