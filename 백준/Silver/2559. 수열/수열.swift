let NK = readLine()!.split {$0==" "}.map {Int($0)!}, N = NK[0], K = NK[1]
let arr = readLine()!.split {$0==" "}.map {Int($0)!}
var sum = arr[0..<K].reduce(0,+), result = sum
for i in K..<N {
    sum += arr[i] - arr[i-K]
    result = max(result,sum)
}
print(result)