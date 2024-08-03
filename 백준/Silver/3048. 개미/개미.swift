let N = readLine()!.split { $0==" " }.map { Int($0)! }
var ant = Array(readLine()!).reversed() + Array(readLine()!)
var index = Array(repeating: 0, count: N[0]) + Array(repeating: 1, count: N[1])

for _ in 0..<Int(readLine()!)! {
	var now = 0
	while now < ant.count-1 {
		if index[now] == index[now+1] || index[now] > index[now+1] {
			now += 1
		} else {
			index.swapAt(now, now+1)
			ant.swapAt(now, now+1)
			now += 2
		}
	}
}
print(String(ant))