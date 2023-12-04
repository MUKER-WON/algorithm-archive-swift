//
//  백설 공주와 일곱 난쟁이(3040).swift
//  Algorithm
//
//  Created by Muker on 12/3/23.
//

import Foundation

func bronze_백설공주와일곱난쟁이() {
	let n = (0..<9).map { _ in Int(readLine()!)! }
	let sum = n.reduce(0,+)
	var criminal = [0,0]
	loop: for i in 0..<9 {
		for j in 0..<9 {
			guard i != j else { continue }
			if sum-n[i]-n[j] == 100 {
				criminal = [i,j]
				break loop
			}
		}
	}
	for i in 0..<9 {
		if !criminal.contains(i) {
			print(n[i])
		}
	}
}

func bronze_백설공주와일곱난쟁이_try2() {
	let n = (0..<9).map { _ in Int(readLine()!)! }
	let s = n.reduce(0,+)

	for i in 0..<8 {
		for j in i+1..<9 where s-n[i]-n[j] == 100 {
			print(n.filter { ![n[i],n[j]].contains($0) }
				.map { String($0) }
				.joined(separator: "\n"))
		}
	}
}
