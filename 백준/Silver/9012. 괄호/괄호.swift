for _ in 0..<Int(readLine()!)! {
	var P = 0
	for C in readLine()! {
		P += (C == "(") ? 1 : -1
		if P < 0 { break }
	}
	print(P == 0 ? "YES" : "NO")
}