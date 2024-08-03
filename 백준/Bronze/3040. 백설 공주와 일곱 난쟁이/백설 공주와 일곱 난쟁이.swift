let n = (0..<9).map { _ in Int(readLine()!)! }
let s = n.reduce(0,+)
for i in 0..<8 {
	for j in i+1..<9 {
		if s-(n[i]+n[j])==100 {
			n.filter { ![n[i],n[j]].contains($0) }.forEach { print($0) }
		}
	}
}