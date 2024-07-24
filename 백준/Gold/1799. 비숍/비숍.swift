let n = Int(readLine()!)!
let chessBoard = (0..<n).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }

let diagonalNum = 2*n-1
var list = Array(repeating: [(Int,Int)](), count: diagonalNum)
var visited = Array(repeating: false, count: diagonalNum)
var ans = 0

for i in 0..<n {
	for j in 0..<n {
		if chessBoard[i][j] == 1 {
			list[i+j].append((i,j))
		}
	}
}

func dfs(n: Int, cnt: Int) {
	if ans >= cnt+(diagonalNum+1-n)/2 {
		return
	}
	
	if n >= diagonalNum {
		ans = max(ans, cnt)
		return
	}
	
	for (i,j) in list[n] {
		let index = i-j >= 0 ? i-j : diagonalNum+(i-j)
		if visited[index] == false {
			visited[index] = true
			dfs(n: n+2, cnt: cnt+1)
			visited[index] = false
		}
	}
	
	dfs(n: n+2, cnt: cnt)
}

dfs(n: 0, cnt: 0)
let ans1 = ans
ans = 0
dfs(n: 1, cnt: 0)

print(ans1 + ans)