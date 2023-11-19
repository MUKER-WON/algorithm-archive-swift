//
//  2의 영역.swift
//  Algorithm
//
//  Created by Muker on 11/18/23.
//

import Foundation

func LV0_2의_영역() {
	
	/// 문제 풀이
	func solution(_ arr:[Int]) -> [Int] {
		guard let firstIndex = arr.firstIndex(of: 2),
					let lastIndex = arr.lastIndex(of: 2) else {
			return [-1]
		}
		return Array(arr[firstIndex...lastIndex])
	}
	
	/// 테스트 케이스
	let cases: [[Int]] = [
		[1, 2, 1, 4, 5, 2, 9],
		[1, 2, 1],
		[1, 1, 1],
		[1, 2, 1, 2, 1, 10, 2, 1],
	]
	cases.forEach {
		print("\(solution($0))")
	}
}
