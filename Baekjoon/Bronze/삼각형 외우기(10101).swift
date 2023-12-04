//
//  삼각형 외우기.swift
//  Algorithm
//
//  Created by Muker on 11/29/23.
//

import Foundation

func bronze_삼각형_외우기() {
	var arr = [Int]()
	for _ in 0..<3 { arr.append(Int(readLine()!)!) }

	func check(a: [Int]) -> String {
		guard a.reduce(0,+) == 180 else { return "Error" }
		let otherNum = Set(a).count
		switch otherNum {
			case 1: return "Equilateral"
			case 2: return "Isosceles"
			default : return "Scalene"
		}
	}
	print(check(a: arr))
}

func bronze_삼각형외우기_try2() {
	let a = (0..<3).map { _ in Int(readLine()!)! }
	if a.reduce(0,+) == 180 {
		let s = Set(a).count
		s == 1 ? print("Equilateral") : s == 2 ? print("Isosceles") : print("Scalene")
	} else { print("Error") }
}
