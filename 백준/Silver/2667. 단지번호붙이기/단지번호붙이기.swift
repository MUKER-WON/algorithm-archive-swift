let N = Int(readLine()!)!
let D = [(0,1),(0,-1),(1,0),(-1,0)]
var G = (0..<N).map { _ in readLine()!.map { Int(String($0))! } }
var ans = [Int]()

func dfs(_ y: Int, _ x: Int) -> Int {
    guard y >= 0 && x >= 0 && y < N && x < N && G[y][x] == 1 else { return 0 }
    G[y][x] = 0
    var C = 1
    for d in D {
        let (dy,dx) = (y+d.0,x+d.1)
        C += dfs(dy, dx)
    }
    return C
}

for i in 0..<N {
    for j in 0..<N {
        if G[i][j] == 1 {
            ans += [dfs(i, j)]
        }
    }
}

print(ans.count)
ans.sorted().forEach {
    print($0)
}