//
//  통나무 건너뛰기(11497).swift
//  Algorithm
//
//  Created by Muker on 12/7/23.
//

import Foundation

func silver_통나무건너뛰기() {
	(0..<Int(readLine()!)!).forEach { _ in
		let N = Int(readLine()!)!
		let arr = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted(by: <)
		var result = Int.min
		for i in 0..<N-2 {
			let n = arr[i+2]-arr[i]
			if n > result { result = n }
		}
		print(result)
	}
}
