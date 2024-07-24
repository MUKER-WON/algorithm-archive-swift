let I = readLine()!.split { $0 == " " }.map { Int($0)! }, (N,M) = (I[0],I[1])
var J = readLine()!.split { $0 == " " }.map { Int($0)! }, (R,C,D) = (J[0],J[1],J[2])
var A = (0..<N).map { _ in readLine()!.split { $0 == " " } }
let direction = [(-1,0),(0,1),(1,0),(0,-1)]
var count = 0

loop: while true {
	if A[R][C] == "0" {
		A[R][C] = "2"
		count += 1
	}
	for _ in 0...3 {
		D = (D+3)%4
		let (dY,dX) = (direction[D].0+R,direction[D].1+C)
		if A[dY][dX] == "0" {
			(R,C) = (dY,dX)
			continue loop
		}
	}
	let b = direction[(D+2)%4]
	let (bY,bX) = (b.0+R,b.1+C)
	(R,C) = (bY,bX)
	if A[bY][bX] == "1" { break }
}
print(count)