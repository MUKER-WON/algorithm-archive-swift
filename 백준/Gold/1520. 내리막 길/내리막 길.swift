let (dy,dx) = ([0,0,1,-1],[1,-1,0,0])
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (M,N) = (I[0],I[1])
let A = (0..<M).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
var DP = Array(repeating: Array(repeating: -1, count: N), count: M)

func DFS(y: Int, x: Int) -> Int {
	if y == M-1 && x == N-1 { return 1 }
	if DP[y][x] != -1 { return DP[y][x] }
	
	DP[y][x] = 0
	for i in 0..<4 {
		let (ny,nx) = (dy[i]+y, dx[i]+x)
		guard ny >= 0 && ny < M && nx >= 0 && nx < N else { continue }
		if A[ny][nx] < A[y][x] {
			DP[y][x] = DP[y][x] + DFS(y: ny, x: nx)
		}
	}
	return DP[y][x]
}
print(DFS(y: 0, x: 0))