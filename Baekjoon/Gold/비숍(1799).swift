//
//  비숍(1799).swift
//  Algorithm
//
//  Created by Muker on 1/27/24.
//

import Foundation

/*
 (0,0) (0,1) (0,2) (0,3) (0,4) (0,5)
 (1,0) (1,1) (1,2) (1,3) (1,4) (1,5)
 (2,0) (2,1) (2,2) (2,3) (2,4) (2,5)
 (3,0) (3,1) (3,2) (3,3) (3,4) (3,5)
 (4,0) (4,1) (4,2) (4,3) (4,4) (4,5)
 (5,0) (5,1) (5,2) (5,3) (5,4) (5,5)
 
 - Right Up: (i+j) 가 같다
 - Right Down: (i-j) 가 같다
 
 */

//MARK: - 두번째 풀이(시간복잡도 개선)

// 체스판을 흰색, 검은색으로 나눠서 각각 탐색하는 경우
// 10의 20승을 계산 되는걸
// 5의 10승, 5의 10승 계산을 해서 시간복잡도을 확 줄일 수 있다.
// 약 0.008초 소요

func 백준_비숍_2() {
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
}


//MARK: - 첫번째 풀이

// 가지치기해서 시간 복잡도를 줄여야 한다.
// 가지치기: 이대로 진행해도 정답 갱신 가능성 없는 경우 더이상 진행하지 않는 것
// 약 3~4초 소요

func 백준_비숍_1() {
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
		// 남은 자리 다 놓아도 정답이 갱신 안되는 경우(가지치기)
		if ans >= cnt+diagonalNum-n {
			return
		}
		
		if n == diagonalNum {
			ans = max(ans, cnt)
			return
		}
		
		for (i,j) in list[n] {
			let index = i-j >= 0 ? i-j : diagonalNum+(i-j)
			if visited[index] == false {
				visited[index] = true
				dfs(n: n+1, cnt: cnt+1)
				visited[index] = false
			}
		}
		
		dfs(n: n+1, cnt: cnt)
	}

	dfs(n: 0, cnt: 0)
	print(ans)
}

