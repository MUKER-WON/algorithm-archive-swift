//
//  내리막 길(1520).swift
//  Algorithm
//
//  Created by Muker on 12/20/23.
//

import Foundation



//MARK: - 실패 풀이1

/// 일반적인 BFS로 구현
func 백준_내리막길_시간초과1() {
	let D = [(0,1),(0,-1),(1,0),(-1,0)]
	let I = readLine()!.split { $0 == " " }.map { Int($0)! },
	(M,N) = (I[0],I[1])
	let A = (0..<M).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	var result = 0
	
	func BFS(Q: [(Int,Int)], visited: [[Bool]]) {
		guard !Q.isEmpty else { return }
		var (Q,visited) = (Q,visited)
		let S = Q.removeFirst()
		if (S.0,S.1) == (M-1,N-1) {
			result += 1
			return
		}
		
		for i in 0..<4 {
			let (ny,nx) = (D[i].0+S.0, D[i].1+S.1)
			guard ny >= 0 && ny < M && nx >= 0 && nx < N else { continue }
			if A[S.0][S.1] > A[ny][nx] && !visited[ny][nx] {
				visited[ny][nx] = true
				BFS(Q: Q+[(ny,nx)], visited: visited)
			}
		}
	}
	BFS(Q: [(0,0)], visited: Array(repeating: Array(repeating: false, count: N), count: M))
	print(result)
}
