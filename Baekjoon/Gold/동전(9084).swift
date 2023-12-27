//
//  동전(9084).swift
//  Algorithm
//
//  Created by Muker on 12/22/23.
//

import Foundation

/// DP 감잡기 좋은 문제

//MARK: - 문제 풀이 1

func 백준_동전() {
	for _ in 0..<Int(readLine()!)! {
		let _ = Int(readLine()!)!
		let coins = readLine()!.split { $0 == " " }.map { Int($0)! }
		let target = Int(readLine()!)!
		var dp = Array(repeating: 0, count: target+1)
		dp[0] = 1
		
		for coin in coins {
			if coin > target { continue }
			for i in coin...target {
				dp[i] += dp[i-coin]
			}
		}
		print(dp[target])
	}
}
