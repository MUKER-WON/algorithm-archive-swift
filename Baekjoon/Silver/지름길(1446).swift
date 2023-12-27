//
//  지름길(1446).swift
//  Algorithm
//
//  Created by Muker on 12/15/23.
//  https://www.acmicpc.net/problem/1446

import Foundation

func silver1_지름길() {
	
	//MARK: - 풀이1
	
	let I = readLine()!.split { $0 == " " }.map { Int($0)! }
	let (N,D) = (I[0],I[1])
	let arr = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
		.filter { $0[1] <= D }
	var dp = (0...D).map { $0 }

	for i in 0...D {
		if i > 0 { dp[i] = min(dp[i], dp[i-1]+1) }
		
		for j in arr {
			let (start,end,length) = (j[0],j[1],j[2])
			
			if i == start && dp[i]+length < dp[end] {
				dp[end] = dp[i]+length
			}
		}
	}

	print(dp[D])
	
}
