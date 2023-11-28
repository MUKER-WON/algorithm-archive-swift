//
//  큰 수 만들기.swift
//  Algorithm
//
//  Created by Muker on 11/28/23.
//

import Foundation

func LV2_큰_수_만들기() {
	func solution(_ number:String, _ k:Int) -> String {
		var count = k
		var stack = [Character]()
		
		for num in number {
			while count > 0
					&& !stack.isEmpty
					&& stack.last! < num
			{
				stack.removeLast()
				count -= 1
			}
			stack.append(num)
		}
		return String(String(stack).prefix(stack.count - count))
	}
}


