for _ in 0..<Int(readLine()!)! {
	let AB = readLine()!.split { $0 == " " }.map { Int($0)! }
	var A = AB[0], B = AB[1]
	var arrA = Set([A]), arrB = Set([B])
	while A > 1 { A = arrA.insert(A/2).memberAfterInsert }
	while B > 1 { B = arrB.insert(B/2).memberAfterInsert }
	print((arrA.intersection(arrB).max() ?? 0) * 10)
}