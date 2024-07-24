var arr = [Int]()
(0..<Int(readLine()!)!).forEach { _ in
	let n = readLine()!.split { $0 == " " }.map { Int($0)! }
	switch n[0] {
		case 2: print(arr.popLast() ?? -1)
		case 3: print(arr.count)
		case 4: print(arr.isEmpty ? 1 : 0)
		case 5: print(arr.last ?? -1)
		default: arr.append(n[1])
	}
}