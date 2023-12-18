//
//  개미(4307).swift
//  Algorithm
//
//  Created by Muker on 12/19/23.
//

import Foundation

func 개미() {
	for _ in 0..<Int(readLine()!)! {
		let n = readLine()!.split { $0 == " " }.map { Int($0)! }
		let a = (0..<n[1]).map { _ in Int(readLine()!)! }
		var (Min,Max) = (0,0)
		for i in a {
			Min = max(min(i,n[0]-i),Min)
			Max = max(max(i,n[0]-i),Max)
		}
		print("\(Min) \(Max)")
	}
}
