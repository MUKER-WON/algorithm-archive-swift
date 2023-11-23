//
//  원하는 문자열 찾기.swift
//  Algorithm
//
//  Created by Muker on 11/19/23.
// https://school.programmers.co.kr/learn/courses/30/lessons/181878

import Foundation

func LV0_원하는문자열찾기() {
	
	/// 문제 풀이
	func solution(_ myString:String, _ pat:String) -> Int {
		return myString.lowercased().contains(pat.lowercased()) ? 1 : 0
	}
	
	/// 테스트 케이스
	let testCase = [
		["AbCdEfG","aBc"],
		["aaAA","aaaaa"]
	]
	testCase.forEach {
		print(solution($0[0], $0[1]))
	}
}
