let I = readLine()!.split { $0 == " " }.map { Int($0)! }, N = I[0], M = I[1]

var result = 0

if N > 0 {
	let weight = readLine()!.split { $0 == " " }.map { Int($0)! }
	var current = M
	result += 1
	for book in weight {
		if current - book >= 0 {
			current -= book
		} else {
			current = M - book
			result += 1
		}
	}
}

print(result)