let N = Int(readLine()!)!
let MOD = 1_000_000_000
var dp = Array(repeating: Array(repeating: 0, count: 10), count: N+1)

for j in 1...9 {
    dp[1][j] = 1
}

if N > 1 {
    for i in 2...N {
        for j in 0...9 {
            if j > 0 { dp[i][j] += dp[i-1][j-1] % MOD }
            if j < 9 { dp[i][j] += dp[i-1][j+1] % MOD }
            dp[i][j] %= MOD
        }
    }
}

print(dp[N].reduce(0) { ($0 + $1) % MOD })