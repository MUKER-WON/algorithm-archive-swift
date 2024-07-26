let D = [(0,1),(0,-1),(1,0),(-1,0)]
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (M,N,K) = (I[0],I[1],I[2])
var G = Array(repeating: Array(repeating: false, count: N), count: M)
var ans = [Int]()

(0..<K).forEach { _ in
    let A = readLine()!.split { $0 == " " }
        .map { Int($0)! }
    for i in M-A[3]..<M-A[1] {
        for j in A[0]..<A[2] {
            G[i][j] = true
        }
    }
}

for i in 0..<M {
    for j in 0..<N {
        let n = dfs(i,j)
        if n > 0 { ans += [n] }
    }
}

print(ans.count)
ans.sorted().forEach { print($0, terminator: " ") }

func dfs(_ y: Int, _ x: Int) -> Int {
    guard y >= 0 && x >= 0 && y < M && x < N && !G[y][x] else { return 0 }
    G[y][x] = true
    var C = 1
    for d in D {
        let (dy, dx) = (y+d.0, x+d.1)
        C += dfs(dy, dx)
    }
    return C
}