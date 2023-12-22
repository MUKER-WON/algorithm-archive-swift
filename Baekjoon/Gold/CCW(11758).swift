//
//  CCW(11758).swift
//  Algorithm
//
//  Created by Muker on 12/22/23.
//

import Foundation

func 백준_CCW_1트() {
	let N = (0..<3).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	print(
		(
			(N[1][0]-N[0][0]) * (N[2][1]-N[0][1]) - (N[2][0]-N[0][0]) * (N[1][1]-N[0][1])
		).signum()
	)
}
