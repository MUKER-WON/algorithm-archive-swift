//
//  괄호(9012).swift
//  Algorithm
//
//  Created by Muker on 11/26/23.
//  https://www.acmicpc.net/problem/9012

import Foundation

func silver_괄호() {
loop1: for _ in 0..<Int(readLine()!)! {
	var stack = [Character]()
	
	for char in readLine()! {
		if char == "(" {
			stack.append("(")
		} else {
			guard !stack.isEmpty && stack.last! == "(" else {
				print("NO")
				continue loop1
			}
			stack.removeLast()
		}
	}
	print(stack.isEmpty ? "YES" : "NO")
}
}

/// 스택 대신 "("값을 정수로 세어 음수나 0이 나온다면 "NO" 아니라면 "YES"
func silver_괄호_2() {
	for _ in 0..<Int(readLine()!)! {
		var result = 0
		for i in readLine()! {
			result += (i == "(") ? 1 : -1
			if result < 0 { break }
		}
		print(result == 0 ? "YES" : "NO")
	}
}

func silver_괄호_3() {
	for _ in 0..<Int(readLine()!)! {
		var P = 0
		for C in readLine()! {
			P += (C == "(") ? 1 : -1
			if P < 0 { break }
		}
		print(P == 0 ? "YES" : "NO")
	}
}
