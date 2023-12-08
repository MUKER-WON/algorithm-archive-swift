//
//  N으로 표현.swift
//  Algorithm
//
//  Created by Muker on 12/8/23.
//

import Foundation

func LV3_N으로표현(_ N:Int, _ number:Int) -> Int {
	if N == number { return 1 }
	var dp = Array(repeating: Set<Int>(), count: 9)
	for i in 1...8 {
		var temp: Set<Int> = [Int(String(repeating: "\(N)", count: i))!]
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
