let a = Array(readLine()!)
let b = Array(readLine()!)
var arr = Array(repeating: Array(repeating: 0, count: b.count+1), count: a.count+1)
var maxNum = 0
for i in 1...a.count {
	for j in 1...b.count {
		if i == 0 || j == 0 { continue }
		if a[i-1] == b[j-1] {
			arr[i][j] = arr[i-1][j-1] + 1
			maxNum = max(arr[i][j], maxNum)
		}
	}
}

print(maxNum)
