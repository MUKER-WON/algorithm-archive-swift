(0..<Int(readLine()!)!).forEach { _ in
	let I = readLine()!.split { $0 == " " }.map { Int($0)! }, N = I[0], M = I[1]
	var r = 1
	for i in 0..<M-N { r = r * (M-i) / (i+1) }
	print(r)
}