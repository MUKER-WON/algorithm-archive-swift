let N = Array(readLine()!)
var S = 0
var result = 0

for i in 0..<N.count {
	if N[i] == "(" {
		S += 1
	} else {
		S -= 1
		result += N[i-1] == "(" ? S : 1
	}
}

print(result)