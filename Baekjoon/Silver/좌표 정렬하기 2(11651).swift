//
//  좌표 정렬하기 2(11651).swift
//  Algorithm
//
//  Created by Muker on 12/4/23.
//

import Foundation

func silver_좌표정렬하기2() {
	var arr = [(Int, Int)]()
	for _ in 1...Int(readLine()!)! {
		let n = readLine()!.split{ $0 == " " }.map{ Int($0)! }
		arr.append((n[1],n[0]))}
	arr.sorted(by: <).forEach{ print("\($0.1) \($0.0)") }
}

//MARK: - second sol

func silver_좌표정렬하기2_try2() {
	let N = Int(readLine()!)!
	let A = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
		.map { ($0[1],$0[0]) }
	A.sorted(by: <).forEach { print("\($0.1) \($0.0)") }
}

//MARK: - third sol

func silver_좌표정렬하기2_3() {
	(0..<Int(readLine()!)!).map { _ in
		readLine()!.split { $0 == " " }.map { Int($0)! }
	}.sorted { ($0[1],$0[0]) < ($1[1],$1[0]) }.forEach {
		print("\($0[0]) \($0[1])")
	}
}
