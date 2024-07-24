func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Int.max, count: y+1)
    dp[x] = 0
    for i in x..<y where dp[i] != Int.max {
        let num1 = i + n
        let num2 = i * 2
        let num3 = i * 3
        
        if num1 <= y {
            dp[num1] = min(dp[i]+1,dp[num1])
        }
        if num2 <= y {
            dp[num2] = min(dp[i]+1,dp[num2])
        }
        if num3 <= y {
            dp[num3] = min(dp[i]+1,dp[num3])
        }
    }
    return dp[y] == Int.max ? -1 : dp[y]
}
