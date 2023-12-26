//
//  main.swift
//  Algorithm
//
//

import Foundation

/*
 let D = [(0,1),(1,0),(-1,0),(0,-1)]
 let I = readLine()!.split { $0 == " " }.map { Int($0)! },
 (M,N) = (I[0],I[1])
 let A = (0..<M).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
 var DP = Array(repeating: Array(repeating: -1, count: N), count: M)
 
 func DFS(y: Int, x: Int) -> Int {
 // 목적지 도착
 if y == M-1 && x == N-1 { return 1 }
 // 들렸던 곳이라면
 if DP[y][x] != -1 { return DP[y][x] }
 
 DP[y][x] = 0
 for i in 0..<4 {
 let (ny,nx) = (D[i].0+y, D[i].1+x)
 guard ny >= 0 && ny < M && nx >= 0 && nx < N else { continue }
 if A[ny][nx] < A[y][x] {
 DP[y][x] = DP[y][x] + DFS(y: ny, x: nx)
 }
 }
 return DP[y][x]
 }
 
 print(DFS(y: 0, x: 0))
 */

let (dy,dx) = ([0,0,1,-1],[1,-1,0,0])

let n = readLine()!.split { $0 == " " }.map { Int($0)! }
let (M,N) = (n[0],n[1])
let arr = (0..<M).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
var dp = Array(repeating: Array(repeating: -1, count: N), count: M)

var ans = 0

func dfs(y: Int, x: Int) -> Int {
	// 마지막 종착지 일 때
	if y == M-1 && x == N-1 {
		ans += 1
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
