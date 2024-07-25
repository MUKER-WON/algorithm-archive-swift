let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: " ", count: N), count: N)

func task(y: Int, x: Int, size: Int) {
	if size == 1 {
		arr[y][x] = "*"
		return
	}
	let new = size/3
	var count = 0
	for i in stride(from: y, to: y+size, by: new) {
		for j in stride(from: x, to: x+size, by: new) {
			count += 1
			guard count != 5 else { continue }
			task(y: i, x: j, size: new)
		}
	}
}
task(y: 0, x: 0, size: N)
arr.forEach { print($0.joined()) }