//
//  경로 찾기(11403).swift
//  Algorithm
//
//  Created by Muker on 12/3/23.
//

import Foundation

func silver_경로찾기() {
	
	let N = Int(readLine()!)!
	let graph = (0..<N).map { _ in readLine()!.split { $0 == " " }.enumerated()
		.filter { $0.element == "1" }
		.map { $0.offset } }
	var result = Array(repeating: Array(repeating: "0", count: N), count: N)

	for i in 0..<N {
		var queue = graph[i]
		while !queue.isEmpty {
			let pop = queue.popLast()!
			if result[i][pop] == "0" {
				result[i][pop] = "1"
				queue += graph[pop]
			}
		}
	}
	result.forEach { print($0.joined(separator: " ")) }
	
}
