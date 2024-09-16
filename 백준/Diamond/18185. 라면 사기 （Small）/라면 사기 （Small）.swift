let N = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { Int($0)! } + [0,0]
var result = 0
for i in 0..<N {
	while true {
		if arr[i] == 0 { break }
		if arr[i+1] > arr[i+2] {
			let n = min(arr[i],arr[i+1]-arr[i+2])
			for j in 0...1 { arr[i+j] -= n }
			result += n*5
			continue
		} else {
			let n = min(arr[i],arr[i+1],arr[i+2])
			for j in 0...2 { arr[i+j] -= n }
			result += n*7
			let m = min(arr[i],arr[i+1])
			for j in 0...1 { arr[i+j] -= m }
			result += m*5
			if arr[i] > 0 {
				result += arr[i]*3
			}
			break
		}
	}
}
print(result)