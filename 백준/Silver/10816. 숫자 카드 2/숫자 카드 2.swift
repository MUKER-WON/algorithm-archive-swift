let _ = readLine()!
	let cardValues = readLine()!
	let _ = readLine()!
	let MNum = readLine()!
	var result = [Int]()
	
	let dic = Dictionary(grouping: cardValues.split { $0 == " " }
		.map { Int($0) ?? 0 }) { $0 }
		.mapValues { $0.count }
	
	let MArr = MNum.split { $0 == " " }
		.map { Int($0)! }
	
	MArr.forEach {
		result.append(dic[$0] ?? 0)
	}
	
	print(result.map { String($0) }.joined(separator: " "))