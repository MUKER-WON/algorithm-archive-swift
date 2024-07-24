let I = readLine()!.split { $0 == " " }.map { Int($0)! }, (N,D) = (I[0],I[1])
let road = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	.filter { $0[1] <= D }
var dis = (0...D).map { $0 }
for i in 0...D {
	if i > 0 { dis[i] = min(dis[i], dis[i-1]+1) }
	for j in road {
		let (s,e,d) = (j[0],j[1],j[2])
		if i == s && dis[i]+d < dis[e] {
			dis[e] = dis[i] + d
		}
	}
}
print(dis[D])