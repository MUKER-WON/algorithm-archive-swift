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

/// 플로이드 워샬 기반의 경로 찾기
func silver_경로찾기_try2() {
	let N = Int(readLine()!)!
	var arr = (0..<N).map { _ in readLine()!.split { $0 == " " } }
	for k in 0..<N {
		for i in 0..<N {
			for j in 0..<N {
				if arr[i][k] == "1" && arr[k][j] == "1" {
					arr[i][j] = "1"
				}
			}
		}
	}
	arr.forEach { print($0.joined(separator: " ")) }
}
