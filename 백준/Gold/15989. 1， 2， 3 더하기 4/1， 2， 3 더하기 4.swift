var dp = Array(repeating: 1, count: 10001)

for i in 2...3 {
    for j in i..<10001 {
        dp[j] += dp[j-i]
    }
}

for _ in 0..<Int(readLine()!)! {
    print(dp[Int(readLine()!)!])
}