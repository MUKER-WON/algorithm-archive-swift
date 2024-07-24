let n = readLine()!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var maxNum = arr.max()!
if maxNum < 0 { print(maxNum) }
else {
    var sum = 0
    maxNum = 0
    for i in arr {
        sum += i
        if sum < 0 { sum = 0 }
        maxNum = max(maxNum, sum)
    }
    print(maxNum)
}