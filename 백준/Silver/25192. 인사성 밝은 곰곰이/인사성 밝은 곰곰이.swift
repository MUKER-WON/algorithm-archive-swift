var strSet: Set<String> = []
var result = 0

(0..<Int(readLine()!)!).forEach { _ in
	let str = readLine()!
	
	if str == "ENTER" {
		result += strSet.count
		strSet = []
	} else {
		strSet.insert(str)
	}
	
}

print("\(result + strSet.count)")