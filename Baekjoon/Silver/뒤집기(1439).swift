//
//  뒤집기(1439).swift
//  Algorithm
//
//  Created by Muker on 11/24/23.
//  https://www.acmicpc.net/problem/1439

import Foundation
/// 아이디어 문제 풀이
func silver_뒤집기() {
	
	func solution() {
		let S = readLine()!
		let A = S.split { $0 != S.first! }
		print(S.first != S.last ? A.count : A.count-1)
	}
	solution()
	
	func solution2() {
		let str = readLine()!

		let a = str.split { $0 == "0" }
		let b = str.split { $0 == "1" }
		print(min(a.count, b.count))
	}
	solution2()
	
}
