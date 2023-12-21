//
//  동전(9084).swift
//  Algorithm
//
//  Created by Muker on 12/22/23.
//

import Foundation

func 백준_동전_1트() {
	for _ in 0..<Int(readLine()!)! {
		let _ = Int(readLine()!)!
		let C = readLine()!.split { $0 == " " }.map { Int($0)! }
		let M = Int(readLine()!)!
		var DP = Array(repeating: 0, count: M+1)
		DP[0] = 1
		
		for i in C {
			if i > M { continue }
			for j in i...M {
				DP[j] += DP[j-i]
			}
		}
		print(DP[M])
	}
}
