//
//  색종이 만들기(2630).swift
//  Algorithm
//
//  Created by Muker on 12/12/23.
//

import Foundation

func silver_색종이만들기() {
	let N = Int(readLine()!)!
	let arr = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	var result = [0,0]

	func task(y: Int, x: Int, size: Int) {
		let standard = arr[y][x]
		var checkAllsafe = true
		
		for i in y..<y+size {
			guard (arr[i][x..<x+size].allSatisfy { $0 == standard }) else {
				checkAllsafe = false
				break
			}
		}
		
		if checkAllsafe {
			result[standard] += 1
		} else {
			let new = size/2
			for i in stride(from: y, to: y+size, by: new) {
				for j in stride(from: x, to: x+size, by: new) {
					task(y: i, x: j, size: new)
				}
			}
		}
		
	}
	task(y: 0, x: 0, size: N)
	result.forEach { print($0) }
}
