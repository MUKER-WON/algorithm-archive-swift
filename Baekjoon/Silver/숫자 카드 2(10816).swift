//
//  숫자 카드 2(10816).swift
//  Algorithm
//
//  Created by Muker on 11/23/23.
//  https://www.acmicpc.net/problem/10816

import Foundation
///dictionay로 풀 수 있는 문제.
func silver_숫자카드2() {
	let _ = readLine()!
	let cardValues = readLine()!
	let _ = readLine()!
	let MNum = readLine()!
	var result = [Int]()
	
	let dic = Dictionary(grouping: cardValues.split { $0 == " " }
		.map { Int($0) ?? 0 }) { $0 }
		.mapValues { $0.count }
	
	let MArr = MNum.split { $0 == " " }
		.map { Int($0)! }
	
	MArr.forEach {
		result.append(dic[$0] ?? 0)
	}
	
	print(result.map { String($0) }.joined(separator: " "))
}
