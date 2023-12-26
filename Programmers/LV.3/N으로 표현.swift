//
//  N으로 표현.swift
//  Algorithm
//
//  Created by Muker on 12/8/23.
//

import Foundation

func LV3_N으로표현(_ N:Int, _ number:Int) -> Int {
	// 후에 나오는 반복문에서 문자열을 편하게 만들기 위해 0인덱스는 비워지게 된다.
	var dp = Array(repeating: Set<Int>(), count: 9)
	// 8번을 반복하며 모든 경우의 수를 더해감
	for i in 1...8 {
		var temp: Set<Int> = [Int(String(repeating: "\(N)", count: i))!]
		/*
		 i가 4라면
		 j는 1,2,3
		 i-j 3,2,1
		 사칙연산을 (1,3),(2,2),(3,1) 총 3번의 6개의 set들의 반복을 실행하게 된다.
		 */
		for j in 1..<i {
			for x in dp[j] {
				for y in dp[i-j] {
					temp.insert(x+y)
					temp.insert(x-y)
					temp.insert(x*y)
					if y != 0 { temp.insert(x/y) }
				}
			}
		}
		if temp.contains(number) { return i }
		dp[i] = temp
	}
	return -1
}
