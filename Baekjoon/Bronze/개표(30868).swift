//
//  개표(30868).swift
//  Algorithm
//
//  Created by Muker on 12/7/23.
//

import Foundation

func bronze_개표() {
	(0..<Int(readLine()!)!).forEach { _ in
		let n = Int(readLine()!)!
		print("\(String(repeating: "++++ ", count: n/5))\(String(repeating: "|", count: n%5))")
	}
}
