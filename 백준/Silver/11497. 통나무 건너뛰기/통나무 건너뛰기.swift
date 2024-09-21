(0..<Int(readLine()!)!).forEach { _ in
	let n = Int(readLine()!)!
	let L = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted(by: <)
	var r = 0
	for i in 2..<n {
		let m = L[i] - L[i-2]
		r = m > r ? m : r
	}
	print(r)
}