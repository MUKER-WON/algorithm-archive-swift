//
//  막대기(1094).swift
//  Algorithm
//
//  Created by Muker on 12/13/23.
//

import Foundation

func 막대기() {
	print(String(Int(readLine()!)!, radix: 2).map { $0 }.filter { $0 == "1" }.count)
}

//MARK: - second sol

func 막대기_2() {
	print(Int(readLine()!)!.nonzeroBitCount)
}

