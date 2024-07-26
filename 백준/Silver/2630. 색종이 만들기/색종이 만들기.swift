let N = Int(readLine()!)!
let A = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
var ans = [0,0]

func sol(_ y: Int, _ x: Int, _ size: Int) {
	let a = A[y][x]
	for i in y..<y+size {
		for j in x..<x+size {
			if A[i][j] != a {
				let new = size/2
				for i in stride(from: y, to: y+size, by: new) {
					for j in stride(from: x, to: x+size, by: new) {
						sol(i, j, new)
					}
				}
				return
			}
		}
	}
	ans[a] += 1
}
sol(0, 0, N)
ans.forEach { print($0) }