import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
	var dp = Array(repeating: Set<Int>(), count: 9)
	for i in 1...8 {
		var temp: Set<Int> = [Int(String(repeating: "\(N)", count: i))!]
		for j in 1..<i {
			for x in dp[j] {
				for y in dp[i-j] {
					temp.insert(x+y)
					temp.insert(x-y)
					temp.insert(x*y)
					if y != 0 { temp.insert(x/y) }
				}
			}
		}
		if temp.contains(number) { return i }
		dp[i] = temp
	}
	return -1
}