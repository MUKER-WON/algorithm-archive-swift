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
