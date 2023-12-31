//
//  게리맨더링2(17779).swift
//  Algorithm
//
//  Created by Muker on 12/28/23.
//

import Foundation

//MARK: - 문제풀이 1

func 백준_게리맨더링2_1() {
	let n = Int(readLine()!)!
	let map = (0..<n).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	var ans = Int.max

	func divide(y: Int, x: Int, d1: Int, d2: Int) -> Int {
		var citizen = [Int](repeating: 0, count: 5)
		
		for r in 0..<n {
			for c in 0..<n {
				if y+x <= r+c, r+c <= y+x+2*d2 && x-y-2*d1 <= c-r, c-r <= x-y {
					citizen[4] += map[r][c]
				} else if 1 <= r, r < y+d1 && 1 <= c, c <= x {
					citizen[0] += map[r][c]
				} else if 1 <= r, r <= y+d2 && x < c, c <= n {
					citizen[1] += map[r][c]
				} else if y+d1 <= r, r <= n && 1 <= c, c < x-d1+d2 {
					citizen[2] += map[r][c]
				} else {
					citizen[3] += map[r][c]
				}
			}
		}
		return citizen.max()! - citizen.min()!
	}

	for y in 1..<n {
		for x in 0..<n-1 {
			for d1 in 1...y {
				for d2 in 1...n-y {
					guard y+d1+d2<=n && 1<=x-d1 && x+d2<=n else { continue }
					ans = min(ans, divide(y: y, x: x, d1: d1, d2: d2))
				}
			}
		}
	}

	print(ans)
}

//MARK: - 풀이 2

func 백준_게리맨더링2_2() {
	let n = Int(readLine()!)!
	let map = (0..<n).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	var ans = Int.max
	var myMap = Array(repeating: Array(repeating: 0, count: n), count: n)

	func task(_ x: Int, _ y: Int, _ d1: Int, _ d2: Int) {
		var citizen = [0,0,0,0,0]
		
		for r in 0..<n {
			for c in 0..<n {
				if x+y <= r+c, r+c <= x+y+2*d2 && y-x-2*d1 <= c-r, c-r <= y-x {
					citizen[4] += map[r][c]
				} else if r >= 0 && x+d1 > r && c >= 0 && y >= c {
					citizen[0] += map[r][c]
				} else if r >= 0 && x+d2 >= r && c > y && n >= c {
					citizen[1] += map[r][c]
				} else if r >= x+d1 && n >= r && c >= 0 && y-d1+d2 > c {
					citizen[2] += map[r][c]
				} else if r > x+d2 && n >= r && c >= y-d1+d2 && n >= c {
					citizen[3] += map[r][c]
				}
			}
		}
		print(citizen.max()! - citizen.min()!)
		ans = min(ans ,citizen.max()! - citizen.min()!)
	}

	for x in 1..<n {
		for y in 1..<n {
			for d1 in 1..<n {
				for d2 in 1..<n {
					task(x-1, y-1, d1, d2)
				}
			}
		}
	}

	print(ans)
}
