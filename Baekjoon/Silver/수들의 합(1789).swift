//
//  수들의 합(1789).swift
//  Algorithm
//
//  Created by Muker on 12/4/23.
//

import Foundation

func silver_수들의합() {
	let S = Int(readLine()!)!
	var sum = 0
	var count = 0
	for i in 1... {
		guard sum <= S else { break }
		sum += i
		count += 1
	}
	print(sum == S ? count : count-1)
}
