//
//  쿼드트리(1992).swift
//  Algorithm
//
//  Created by Muker on 11/27/23.
//

import Foundation

func silver_쿼드트리() {
	let N = Int(readLine()!)!
	var nArr = [[Character]]()
	var result = [String]()

	// 문자열을 [Char]타입으로 N에 저장
	for _ in 0..<N {
		nArr.append(Array(readLine()!))
	}

	/// 4분할 재귀함수
	func divideConquer(x: Int, y: Int, size: Int) {
		let start = nArr[y][x]
		var checkEqual = true

	loop: for y in y..<y+size {
		for x in x..<x+size {
			if nArr[y][x] != start {
				checkEqual = false
				break loop
			}
		}
	}
		
		if checkEqual {
			result.append(String(start))
		} else {
			result.append("(")
			let new = size / 2
			divideConquer(x: x, y: y, size: new)
			divideConquer(x: x+new, y: y, size: new)
			divideConquer(x: x, y: y+new, size: new)
			divideConquer(x: x+new, y: y+new, size: new)
			result.append(")")
		}
		
	}

	divideConquer(x: 0, y: 0, size: N)
	print(result.joined())
}
