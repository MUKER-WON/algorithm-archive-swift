let NM = readLine()!.split { $0 == " " }.map { Int($0)! }, N = NM[0], M = NM[1]
let arr = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
var result = 0
for i in 0..<M-2 {
	for j in i+1..<M-1 {
		for k in j+1..<M {
			result = max(
				result,
				(0..<N).map { max(arr[$0][i],arr[$0][j],arr[$0][k]) }.reduce(0,+)
			)
		}
	}
}
print(result)