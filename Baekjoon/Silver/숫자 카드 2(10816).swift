//
//  숫자 카드 2(10816).swift
//  Algorithm
//
//  Created by Muker on 11/23/23.
//  https://www.acmicpc.net/problem/10816

import Foundation

func silver_숫자카드() {
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

//MARK: - second sol

func silver_숫자카드2_2() {
	let _ = readLine()!
	let card = Dictionary(grouping: readLine()!.split { $0 == " " }) { $0 }
	let _ = readLine()!
	let has = readLine()!.split { $0 == " " }
	var result = [String]()

	for i in has { result.append(String(card[i]?.count ?? 0)) }

	print(result.joined(separator: " "))

}
