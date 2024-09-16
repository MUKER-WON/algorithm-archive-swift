import Foundation

var n = Int(readLine()!)!
var order = [Int]()
let arr = Array(readLine()!.split(separator: " ").compactMap { Int($0) }.sorted().reversed())

for i in 0..<n {
	if i % 2 == 1 {
		order.append(arr[i])
	} else {
		order.insert(arr[i], at: 0)
	}
}

var (ans, lastX, lastY) = (0.0, -1.0, -1.0)

for i in 0...n {
	let ang = Double(i % n) * (2 * Double.pi / Double(n))
	let curX = cos(ang) * Double(order[i % n])
	let curY = sin(ang) * Double(order[i % n])
	
	if i > 0 {
		ans += lastX * curY - lastY * curX
	}
	
	lastX = curX
	lastY = curY
}

print(String(format: "%.3f", ans * 0.5))