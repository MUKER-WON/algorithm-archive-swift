//
//  가장 긴 증가하는 부분 수열(11053).swift
//  Algorithm
//
//  Created by Muker on 12/31/23.
//

import Foundation

//MARK: - 풀이 1

func 백준_가장긴증가하는부분수열_1() {
	let n = Int(readLine()!)!
	let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
	var dp = [Int](repeating: 1, count: n)

	for i in 0..<n {
		for j in 0..<i+1 {
			if arr[j] < arr[i] {
				dp[i] = max(dp[i], dp[j]+1)
			}
		}
	}
	print(dp.max()!)
}
