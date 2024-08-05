var arr = [Int]()
for _ in 0..<3 { arr.append(Int(readLine()!)!) }

func check(a: [Int]) -> String {
	let otherNum = Dictionary(grouping: a) { $0 }.values.count
	let sum = a.reduce(0,+)
	if a.allSatisfy({ $0 == 60 }) { return "Equilateral" }
	if sum == 180 && otherNum == 2 { return "Isosceles" }
	if sum == 180 && otherNum == 3 { return "Scalene" }
	return "Error"
}
print(check(a: arr))