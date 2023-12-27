//
//  CCW(11758).swift
//  Algorithm
//
//  Created by Muker on 12/22/23.
//

import Foundation

//MARK: - 풀이 2

func 백준_CCW_2() {
	let f = { readLine()!.split { $0 == " " }.map { Int($0)! } }
	let (a,b,c) = (f(),f(),f())

	print(((b[0]-a[0]) * (c[1]-a[1]) - (c[0]-a[0]) * (b[1]-a[1])).signum())
}

//MARK: - 풀이 1

func 백준_CCW_1() {
	let N = (0..<3).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	print(
		(
			(N[1][0]-N[0][0]) * (N[2][1]-N[0][1]) - (N[2][0]-N[0][0]) * (N[1][1]-N[0][1])
		).signum()
	)
}
