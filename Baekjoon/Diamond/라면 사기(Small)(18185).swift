//
//  라면 사기(Small)(18185).swift
//  Algorithm
//
//  Created by Muker on 12/12/23.
//

import Foundation

func diamond_라면사기_small() {
	
	let N = Int(readLine()!)!
	var arr = readLine()!.split { $0 == " " }.map { Int($0)! } + [0,0]
	var result = 0
	for i in 0..<N {
		while true {
			if arr[i] == 0 { break }
			// 두번째가 세번째보다 클 때, 첫번째와 두번째만 세번째 기준에 맞춰 줄여준다.
			if arr[i+1] > arr[i+2] {
				let n = min(arr[i],arr[i+1]-arr[i+2])
				for j in 0...1 { arr[i+j] -= n }
				result += n*5
				continue
			}
			// 두번째가 세번째보다 작거나 클 때, 첫번째 두번째 세번째 중 작은걸 구해서 줄이고
			// 두번째와 첫번째 중 작은걸 구해서
			// 첫번째가 남아있다면 나머지를 나눴다.
			else {
				let n = min(arr[i],arr[i+1],arr[i+2])
				for j in 0...2 { arr[i+j] -= n }
				result += n*7
				let m = min(arr[i],arr[i+1])
				for j in 0...1 { arr[i+j] -= m }
				result += m*5
				if arr[i] > 0 { result += arr[i]*3 }
				break
			}
		}
	}
	print(result)
	
}
