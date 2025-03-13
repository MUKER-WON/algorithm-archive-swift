let N = Int(readLine()!)!
let MOD = 1_000_000_000
var dp = [0,1,1,1,1,1,1,1,1,1]

for _ in 1..<N {
    var new = dp
    (new[0],new[9]) = (dp[1],dp[8])
    
    for i in 1...8 {
        new[i] = (dp[i-1]+dp[i+1]) % MOD
    }
    dp = new
}

print(dp.reduce(0) { ($0 + $1) % MOD })