let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0],K = NK[1]

var dp = Array(repeating: 0, count: K+1)
for _ in 0..<N {
    let WV = readLine()!.split(separator: " ").map { Int($0)! }
    let W = WV[0],V = WV[1]
    
    for i in stride(from: K - W, through: 0, by: -1) {
        if (i == 0 || dp[i] > 0) && dp[i] + V > dp[i+W] {
            dp[i+W] = dp[i] + V
        }
    }
}
print(dp.max()!)