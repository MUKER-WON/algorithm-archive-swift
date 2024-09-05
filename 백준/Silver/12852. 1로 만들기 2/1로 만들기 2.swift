let N = Int(readLine()!)!
var dp = Array(repeating: [Int](), count: N+1)
for i in 1...N {
    if i == 1 { continue }
    dp[i] = dp[i-1]+[i-1]
    if i % 3 == 0 && dp[i].count > dp[i/3].count+1 {
        dp[i] = dp[i/3]+[i/3]
    }
    if i % 2 == 0 && dp[i].count > dp[i/2].count+1 {
        dp[i] = dp[i/2]+[i/2]
    }
}
print(dp[N].count)
print(N, terminator: " ")
dp[N].reversed().forEach { print($0, terminator: " ") }