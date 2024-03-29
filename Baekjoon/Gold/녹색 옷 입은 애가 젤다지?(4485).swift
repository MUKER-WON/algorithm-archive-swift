//
//  녹색 옷 입은 애가 젤다지?(4485).swift
//  Algorithm
//
//  Created by Muker on 12/19/23.
//

import Foundation

// 우선순위큐를 사용한 다익스트라 문제
// 방문을 체크하는 배열, 최소값을 카운트하는 배열이 필요함

//MARK: - 성공 풀이2

func 백준_녹색옷입은애가젤다지_2() {
	let (dy,dx) = ([0,0,1,-1],[1,-1,0,0])

	for T in 1... {
		let N = Int(readLine()!)!
		if N == 0 { break }
		
		let arr = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
		var visited = Array(repeating: Array(repeating: false, count: N), count: N)
		var countArr = Array(repeating: Array(repeating: Int.max, count: N), count: N)
		var queue = [(0,0)]
		countArr[0][0] = arr[0][0]
		
		while !queue.isEmpty {
			let (y,x) = queue.popLast()!
			if countArr[y][x] > countArr[N-1][N-1] { continue }
			
			for i in 0..<4 {
				let (ny,nx) = (dy[i]+y,dx[i]+x)
				guard ny >= 0 && ny < N && nx >= 0 && nx < N else { continue }
				
				// 최단거리 최신화
				countArr[ny][nx] = min(countArr[ny][nx],
									   countArr[y][x] + arr[ny][nx])
				
				if !visited[ny][nx] {
					queue.append((ny,nx))
					visited[ny][nx] = true
				}
			}
			
			queue.sort { countArr[$0.0][$0.1] > countArr[$1.0][$1.1] }
		}
		
		print("Problem \(T): \(countArr[N-1][N-1])")
	}
}

//MARK: - 성공 풀이 1

func 백준_녹색옷입은애가젤다지_1() {
	let D = [(0,1),(0,-1),(1,0),(-1,0)]
	var str = ""

	for i in 1... {
		let N = Int(readLine()!)!
		guard N != 0 else { break }
		
		let A = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
		var V = Array(repeating: Array(repeating: false, count: N), count: N)
		var C = Array(repeating: Array(repeating: Int.max, count: N), count: N)
		var Q = [(0,0)]
		C[0][0] = A[0][0]
		
		while !Q.isEmpty {
			let node = Q.popLast()!
			let (y,x) = (node.0,node.1)
			// 방문처리
			guard !V[y][x] else { continue }
			V[y][x] = true
			// 상하좌우 그래프 탐색
			for j in 0..<4 {
				let (ny,nx) = (D[j].0+y, D[j].1+x)
				guard ny >= 0 && ny < N && nx >= 0 && nx < N && !V[ny][nx] else { continue }
				C[ny][nx] = min(C[ny][nx],C[y][x]+A[ny][nx])
				Q.append((ny,nx))
			}
			Q.sort { C[$0.0][$0.1] > C[$1.0][$1.1] }
		}
		str += "Problem \(i): \(C[N-1][N-1])\n"
	}
	print(str)
}

//MARK: - 실패 풀이

func 백준_녹색옷입은애가젤다지_시간초과1() {
	let D = [(0,1),(0,-1),(1,0),(-1,0)]

	for i in 1... {
		let N = Int(readLine()!)!
		guard N != 0 else { break }
		let A = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
		var result = Int.max
		
		func task(y: Int, x: Int, arr: [[Int]], pay: Int) {
			var newArr = arr
			let newpay = pay + arr[y][x]
			newArr[y][x] = -1
			
			if (y,x) == (N-1,N-1) {
				result = min(newpay, result)
				return
			}
			
			for i in 0..<4 {
				let (ny,nx) = (y+D[i].0,x+D[i].1)
				guard ny >= 0 && ny < N && nx >= 0 && nx < N && arr[ny][nx] >= 0 else { continue }
				task(y: ny, x: nx, arr: newArr, pay: newpay)
			}
		}
		task(y: 0, x: 0, arr: A, pay: 0)
		print("Problem \(i): \(result)")
	}
}
