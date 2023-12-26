//
//  내리막 길(1520).swift
//  Algorithm
//
//  Created by Muker on 12/20/23.
//

import Foundation

/// 지점까지의 가능 경로를 구하는 문제이다.
/// 기본적인 그래프탐색으로는 시간초과가 되기 때문에 적절히 DP를 사용해야한다.
///
/// 이 문제는 재귀함수에서 리턴값을 받아 올라오며 최종적인 리턴값 즉 DP(0,0)의 정수가 정답이 된다.

//MARK: - 성골 풀이1 [DP + DFS]

func 백준_내리막길_1() {
	let (dy,dx) = ([0,0,1,-1],[1,-1,0,0])
	let n = readLine()!.split { $0 == " " }.map { Int($0)! }
	let (M,N) = (n[0],n[1])
	let arr = (0..<M).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	var dp = Array(repeating: Array(repeating: -1, count: N), count: M)

	func dfs(y: Int, x: Int) -> Int {
		// 마지막 종착지 일 때
		if y == M-1 && x == N-1 {
			return 1
		}
		// 방문했던 곳 일 때, 더 이상 재귀를 호출하지 않고 방문됐던 값만 받아옴
		if dp[y][x] != -1 {
			return dp[y][x]
		}
		// 방문 처리
		dp[y][x] = 0
		
		for i in 0..<4 {
			let (ny,nx) = (dy[i]+y,dx[i]+x)
			guard ny >= 0 && ny < M && nx >= 0 && nx < N else { continue }
			if arr[ny][nx] < arr[y][x] {
				dp[y][x] += dfs(y: ny, x: nx)
			}
			
		}
		return dp[y][x]
	}

	print(dfs(y: 0, x: 0))
}

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
				// 해당 방문처리로는 부족하다
				visited[ny][nx] = true
				BFS(Q: Q+[(ny,nx)], visited: visited)
			}
		}
	}
	BFS(Q: [(0,0)], visited: Array(repeating: Array(repeating: false, count: N), count: M))
	print(result)
}
