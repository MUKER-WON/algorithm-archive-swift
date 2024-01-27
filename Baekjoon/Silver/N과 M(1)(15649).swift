//
//  N과 M(1)(15649).swift
//  Algorithm
//
//  Created by Muker on 1/14/24.
//

import Foundation

func silver_N과M_1() {
	let I = readLine()!.split { $0 == " " }.map { Int($0)! }, (N,M) = (I[0],I[1])
	func task(arr: [Int]) {
		if arr.count == M {
			print(arr.map { String($0) }.joined(separator: " "))
			return
		}
		for i in 1...N where !arr.contains(i) {
			task(arr: arr+[i])
		}
	}
	task(arr: [])
}
