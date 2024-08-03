let D = [(0,1),(0,-1),(1,0),(-1,0)]
for T in 1... {
	guard let N = Int(readLine()!), N != 0 else { break }
	let A = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { Int($0)! } }
	var V = Array(repeating: Array(repeating: true, count: N), count: N)
	var C = Array(repeating: Array(repeating: Int.max, count: N), count: N)
	var Q = [(0,0)]
	C[0][0] = A[0][0]
	
	while !Q.isEmpty {
		let S = Q.popLast()!
		if C[S.0][S.1] > C[N-1][N-1] { continue }
		
		for i in 0..<4 {
			let (ny,nx) = (D[i].0 + S.0, D[i].1 + S.1)
			guard ny >= 0 && ny < N && nx >= 0 && nx < N else { continue }
			C[ny][nx] = min(C[ny][nx],C[S.0][S.1]+A[ny][nx])
			if V[ny][nx] {
				Q.append((ny,nx))
				V[ny][nx] = false
			}
		}
		Q.sort { C[$0.0][$0.1] > C[$1.0][$1.1] }
	}
	print("Problem \(T): \(C[N-1][N-1])")
}