//
//  N-Queen(9663).swift
//  Algorithm
//
//  Created by Muker on 12/9/23.
//

// https://www.acmicpc.net/problem/9663
// 브루트포스
// 백트래킹

//MARK: - 성공 풀이2

func N_Queen_2트() {
	let N = Int(readLine()!)!
	var v1 = Array(repeating: 0, count: N)
	var v2 = Array(repeating: 0, count: N*2)
	var v3: Set<Int> = []
	var ans = 0

	func dfs(y: Int) {
		if y == N {
			ans += 1
			return
		}
		for x in 0..<N {
			if (v1[x],v2[y+x]) == (0,0) && !v3.contains(x-y) {
				(v1[x], v2[y+x]) = (1,1)
				v3.insert(x-y)
				dfs(y: y+1)
				(v1[x], v2[y+x]) = (0,0)
				v3.remove(x-y)
			}
		}
	}
	dfs(y: 0)
	print(ans)
}

//MARK: - 성공 풀이1

func N_Queen() {
	
	func task(n: Int) {
		var visited = Array(repeating: false, count: n)
		var board = Array(repeating: -1, count: n)
		var ans = 0
		
		func promising(row: Int) -> Bool {
			for compareRow in 0..<row {
				if board[compareRow] == board[row]
						|| abs(board[compareRow] - board[row]) == (row-compareRow) {
							return false
						}
			}
			return true
		}
		
		func dfs(row: Int) {
			if row == n {
				ans += 1
				return
			}
			for checkCol in 0..<n {
				guard !visited[checkCol] else { continue }
				board[row] = checkCol
				if promising(row: row) {
					visited[checkCol] = true
					dfs(row: row+1)
					visited[checkCol] = false
				}
			}
		}
		dfs(row: 0)
		print(ans)
	}
	task(n: Int(readLine()!)!)
}

//MARK: - 실패 풀이1

func N_Queen_시간초과실패2() {
	func Q(_ n: Int,_ c: Int = 0,_ a: [Int] = [])-> [[Int]] {
		return c == n ? [a] : (0..<n).filter{
			y in (0..<c).filter{
				y == a[$0] || c - $0 == abs(y-a[$0])
			}.isEmpty
		}.flatMap {
			Q(n,c+1,a+[$0])
		}
	}
	print(Q(Int(readLine()!)!).count)
}

//MARK: - 실패 풀이2

func N_Queen_시간초과실패() {
	let N = Int(readLine()!)!
	var result = 0
	let D = [(-1,0),(0,1),(1,0),(0,-1),(1,1),(-1,-1),(-1,1),(1,-1)]

	func task(queen: [(Int,Int)], chess: [[Bool]]) {
		if queen.count == N {
			result += 1
			return }
		if chess.allSatisfy({ $0.allSatisfy { $0 == false } }) { return }
		
		for i in 0..<N {
			for j in 0..<N {
				guard queen.filter({ $0 == (i,j) }).isEmpty else { continue }
				guard chess[i][j] else { continue }
				var new = chess
				
				for k in 0..<7 {
					var temp = (i,j)
					
					while true {
						temp = (temp.0+D[k].0,temp.1+D[k].1)
						guard temp.0 >= 0 && temp.0 < N && temp.1 >= 0 && temp.1 < N else { break }
						new[temp.0][temp.1] = false
					}
				}
				
				task(queen: queen+[(i,j)], chess: new)
			}
		}
	}
	task(queen: [], chess: Array(repeating: Array(repeating: true, count: N), count: N))
	print(result)
}
