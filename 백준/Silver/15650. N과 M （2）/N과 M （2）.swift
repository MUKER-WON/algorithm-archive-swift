let I = readLine()!.split { $0 == " " }.map { Int($0)! }
func task(a: [Int]) {
	if a.count == I[1] {
		print(a.map { String($0) }.joined(separator: " "))
		return
	}
	for i in 1...I[0] where a.last ?? 0 < i {
		task(a: a+[i])
	}
}
task(a: [])