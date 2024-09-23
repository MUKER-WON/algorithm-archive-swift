let n = Int(readLine()!)!
var arr = [0]+(0..<n).map { _ in Int(readLine()!)! }
var dp = Array(repeating: 0, count: n+1)

for i in 1...n {
    if i == 1 { dp[i] = arr[i]; continue }
    if i == 2 { dp[i] = max(dp[i-1]+arr[i], dp[i-2]+arr[i]); continue }
    dp[i] = max(dp[i-3]+arr[i-1]+arr[i], dp[i-2]+arr[i])
}

print(dp[n])