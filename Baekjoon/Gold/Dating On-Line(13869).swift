//
//  Dating On-Line(13869).swift
//  Algorithm
//
//  Created by Muker on 1/1/24.
//

import Foundation

//MARK: - 풀이 1

func 백준_dating_on_line_1() {
	let n = Int(readLine()!)!
	let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
	var order = [Int]()

	for i in 0..<n {
		if i % 2 == 1 { order.append(arr[i]) }
		else { order.insert(arr[i], at: 0) }
	}

	var (ans, lastX, lastY) = (0.0, -1.0, -1.0)

	for i in 0...n {
		let ang = Double(i % n) * (2 * Double.pi / Double(n))
		let curX = cos(ang) * Double(order[i % n])
		let curY = sin(ang) * Double(order[i % n])
		
		if i > 0 { ans += lastX * curY - lastY * curX }
		
		lastX = curX
		lastY = curY
	}

	print(String(format: "%.3f", ans * 0.5))
}
