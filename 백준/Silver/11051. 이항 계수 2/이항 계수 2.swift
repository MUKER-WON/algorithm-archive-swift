let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,K) = (I[0],I[1])
var dp = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)

for i in 0...N {
    for j in 0...min(i,K) {
        if j == 0 || j == i { dp[i][j] = 1 }
        else { dp[i][j] = (dp[i-1][j-1] + dp[i-1][j]) % 10007 }
    }
}
print(dp[N][K])