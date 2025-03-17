var dp = Array(repeating: 0, count: 10001)
dp[0] = 1

for i in 1...3 {
    for j in i..<10001 {
        dp[j] += dp[j-i]
    }
}

for _ in 0..<Int(readLine()!)! {
    print(dp[Int(readLine()!)!])
}