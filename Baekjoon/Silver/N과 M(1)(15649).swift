//
//  File.swift
//  Algorithm
//
//  Created by Muker on 12/5/23.
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
