let n = Int(readLine()!)!
var map = [[]] + (0..<n).map { _ in [0]+readLine()!.split { $0 == " " }.map { Int($0)! } }
var ans = Int.max

func divide(y: Int, x: Int, d1: Int, d2: Int) -> Int {
	var citizen = [Int](repeating: 0, count: 5)
	
	for r in 1...n {
		for c in 1...n {
			if y+x <= r+c, r+c <= y+x+2*d2 && x-y-2*d1 <= c-r, c-r <= x-y {
				citizen[4] += map[r][c]
			} else if 1 <= r, r < y+d1 && 1 <= c, c <= x {
				citizen[0] += map[r][c]
			} else if 1 <= r, r <= y+d2 && x < c, c <= n {
				citizen[1] += map[r][c]
			} else if y+d1 <= r, r <= n && 1 <= c, c < x-d1+d2 {
				citizen[2] += map[r][c]
			} else {
				citizen[3] += map[r][c]
			}
		}
	}
	return citizen.max()! - citizen.min()!
}

for y in 1..<n {
	for x in 1..<n {
		for d1 in 1..<n {
			for d2 in 1..<n {
				guard y+d1+d2<=n && 1<=x-d1 && x+d2<=n else { continue }
				ans = min(ans, divide(y: y, x: x, d1: d1, d2: d2))
			}
		}
	}
}

print(ans)