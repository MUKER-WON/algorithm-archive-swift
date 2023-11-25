//
//  쇠막대기(10799).swift
//  Algorithm
//
//  Created by Muker on 11/25/23.
//  https://www.acmicpc.net/problem/10799

import Foundation


func silver_쇠막대기() {
	/// 괄호가 쌓이는 문제는 대개 스택으로 풀린다.
	/// 2가지의 풀이 방법이 생각났었다.
	/// 첫번째 방법은
	/// 레이저가 나올 때 가지고 있는 막대기 마다
	/// 처음 잘리는 막대기는 result += 2
	/// 한번 잘렸던 막대기는 result += 1 하는 방법이고
	/// 두번째 방법은
	/// 레이저가 나올 때 가지고 있는 막대기 마다 result += 1
	/// 막대기가 작업대에서 내려올 때 result += 1 하는 방법이다.
	/// 후자의 방법으로 풀었다.
	func solution() {
		let input = Array(readLine()!)
		var stack = [String]()
		var result = 0
		
		for index in 0..<input.count {
			if input[index] == "(" {
				stack.append("(")
			}
			else {
				guard let last = stack.last else { break }
				stack.removeLast()
				if last == "(", input[index-1] == "(" {
					result += stack.count
				}
				else {
					result += 1
				}
			}
		}
		print(result)
	}
	
	solution()
}
