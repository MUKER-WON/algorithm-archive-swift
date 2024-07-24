let N = Int(readLine()!)!
var arr = [[Character]]()
var result = ""

for _ in 0..<N {
	arr.append(Array(readLine()!))
}

func QuadTree(y: Int, x: Int, size: Int) {
	let start = arr[y][x]
	var equal = true
	
loop: for y in y..<y+size {
	for x in x..<x+size {
		if arr[y][x] != start {
			equal = false
			break loop
		}
	}
}
	
	if equal {
		result.append(start)
	} else {
		let new = size / 2
		result.append("(")
		for i in stride(from: y, to: y+size, by: new) {
			for j in stride(from: x, to: x+size, by: new) {
				QuadTree(y: i, x: j, size: new)
			}
		}
		result.append(")")
	}
	
}

QuadTree(y: 0, x: 0, size: N)
print(result)