(0..<Int(readLine()!)!).forEach { _ in
	let n = Int(readLine()!)!
	print("\(String(repeating: "++++ ", count: n/5))\(String(repeating: "|", count: n%5))")
}