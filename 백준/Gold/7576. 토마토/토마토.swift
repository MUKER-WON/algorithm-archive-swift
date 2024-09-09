let D = [(0,1),(0,-1),(1,0),(-1,0)]
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (M,N) = (I[0],I[1])
var T = [(Int,Int)]()
var G = (0..<N).map { i -> [Int] in
    let A = readLine()!.split { $0 == " " }.map { Int($0)! }
    (0..<M).forEach { j in if A[j] == 1 { T.append((i,j))} }
    return A
}

var index = 0
while index != T.count {
    let (cy, cx) = T[index]
    index += 1
    for d in D {
        let (dy, dx) = (cy+d.0, cx+d.1)
        guard dy >= 0 && dy < N && dx >= 0 && dx < M else { continue }
        guard G[dy][dx] == 0 else { continue }
        G[dy][dx] = G[cy][cx] + 1
        T.append((dy, dx))
    }
}
let RT = G.flatMap { $0 }
print(RT.contains(0) ? -1 : RT.max()!-1)