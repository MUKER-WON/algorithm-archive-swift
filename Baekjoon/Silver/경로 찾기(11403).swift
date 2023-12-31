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

//MARK: - second sol

/// result 배열을 만들지 않고 푼 풀이
func silver_경로찾기_try1() {
	let N = Int(readLine()!)!
	var A = (0..<N).map { i in readLine()!.split { $0 == " " }
			.enumerated().filter { $0.element == "1" }
			.map { $0.offset }
	}

	for i in 0..<N {
		var stack = A[i]
		while !stack.isEmpty {
			A[stack.removeLast()].forEach {
				if !A[i].contains($0) {
					A[i].append($0)
					stack.append($0)
				}
			}
		}
	}

	A.forEach {
		var str = ""
		for i in 0..<N {
			str.append("\($0.contains(i) ? "1" : "0") ")
		}
		print(str)
	}
}

//MARK: - third sol

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
