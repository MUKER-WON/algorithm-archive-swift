let n = Int(readLine()!)!
var step = [0]+(0..<n).map { _ in Int(readLine()!)! }
var dp = Array(repeating: 0, count: n+1)

for i in 1...n {
    if i == 1 { dp[i] = step[i]; continue }
    if i == 2 { dp[i] = dp[i-1]+step[i]; continue }
    dp[i] = max(dp[i-3]+step[i-1]+step[i], dp[i-2]+step[i])
}

print(dp[n])