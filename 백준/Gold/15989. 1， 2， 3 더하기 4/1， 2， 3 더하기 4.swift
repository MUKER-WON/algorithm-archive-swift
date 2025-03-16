var dp = Array(repeating: [0,1,0,0], count: 10001)

for i in 2...10000 {
    dp[i][2] = dp[i-2][2] + dp[i-2][1]
}

for i in 3...10000 {
    dp[i][3] = dp[i-3][3] + dp[i-3][2] + dp[i-3][1]
}


for _ in 0..<Int(readLine()!)! {
    print(dp[Int(readLine()!)!].reduce(0,+))
}