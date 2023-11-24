//
//  배열 조각하기.swift
//  Algorithm
//
//  Created by Muker on 11/24/23.
//  https://school.programmers.co.kr/learn/courses/30/lessons/181893

import Foundation

func lv0_배열조각하기() {
	
	func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
		var result = arr
		
		query.indices.forEach {
			if $0 % 2 == 0 {
				result = Array(result[0...query[$0]])
			} else {
				result = Array(result[query[$0]...])
			}
		}
		
		return result
	}
	
	print(solution([4, 5, 4], [1, 0]))
}
