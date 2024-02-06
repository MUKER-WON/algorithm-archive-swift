//
//  LCS(9251).swift
//  Algorithm
//
//  Created by Muker on 2/6/24.
//

import Foundation

// LCS
// Longest Common Subsequence

//MARK: - 첫번째 풀이

func LCS_1() {
	
	let (a,b) = (Array(readLine()!), Array(readLine()!))
	var arr = Array(repeating: Array(repeating: 0, count: b.count+1), count: a.count+1)
	var ans = 0

	for i in 1...a.count {
		for j in 1...b.count {
			if a[i-1] == b[j-1] {
				arr[i][j] = arr[i-1][j-1] + 1
				ans = max(arr[i][j], ans)
			} else {
				arr[i][j] = max(arr[i-1][j], arr[i][j-1])
			}
		}
	}
	print(ans)
}

