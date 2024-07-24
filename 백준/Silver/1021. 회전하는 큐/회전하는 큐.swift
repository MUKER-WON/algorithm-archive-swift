let I = readLine()!.split {$0==" "}.map {Int($0)!}, N = I[0]
let target = readLine()!.split {$0==" "}.map {Int($0)!}
var queue = Array(1...N)
var pointer = 0
var result = 0

for target in target {
	if pointer > queue.count-1 { pointer = 0 }
	if target == queue[pointer] {
		queue.remove(at: pointer)
		continue
	}
	var left = pointer
	var right = pointer
	var count = 0
	while true {
		left = left-1 < 0 ? queue.count-1 : left-1
		right = right+1 > queue.count-1 ? 0 : right+1
		count += 1
		if queue[left] == target {
			queue.remove(at: left)
			pointer = left
		} else if queue[right] == target {
			queue.remove(at: right)
			pointer = right
		} else {
			continue
		}
		result += count
		break
	}
}
print(result)