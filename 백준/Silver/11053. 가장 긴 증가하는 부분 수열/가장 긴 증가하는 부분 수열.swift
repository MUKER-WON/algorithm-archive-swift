let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
var dp = [Int](repeating: 1, count: n)

for i in 0..<n {
	for j in 0..<i+1 {
		if arr[j] < arr[i] {
			dp[i] = max(dp[i], dp[j]+1)
		}
	}
}

print(dp.max()!)