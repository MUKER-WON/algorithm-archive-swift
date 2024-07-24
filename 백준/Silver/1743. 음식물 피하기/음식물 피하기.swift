let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M,K) = (I[0],I[1],I[2])
let D = [(0,1),(0,-1),(1,0),(-1,0)]
var G = Array(repeating: Array(repeating: false, count: M), count: N)
(0..<K).forEach { _ in
    let T = readLine()!.split { $0 == " " }.map { Int($0)!-1 }
    G[T[0]][T[1]] = true
}
var ans = 0

for i in 0..<N {
    for j in 0..<M {
        var (Q, C) = ([(i,j)], 0)
        while !Q.isEmpty {
            let (y,x) = Q.popLast()!
            if G[y][x] { C += 1 }
            G[y][x] = false
            for d in D {
                let (dy,dx) = (y+d.0,x+d.1)
                guard dy >= 0 && dy < N && dx >= 0 && dx < M else { continue }
                guard G[dy][dx] else { continue }
                Q.append((dy,dx))
            }
        }
        ans = max(ans, C)
    }
}
print(ans)