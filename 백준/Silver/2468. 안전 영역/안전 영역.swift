let N = Int(readLine()!)!
let M = (0..<N).map { _ in
    readLine()!.split { $0 == " " }.map { Int($0)! }
}
let D = [(0,1),(0,-1),(1,0),(-1,0)]
var newM = M
let height = Set(M.flatMap { $0 }).sorted()
var result = [1]

func dfs(_ y: Int, _ x: Int, _ h: Int ) {
    guard y >= 0 && x >= 0 && y < N && x < N && newM[y][x] > h else { return }
    newM[y][x] = h
    for d in D {
        dfs(y+d.0, x+d.1, h)
    }
}
for h in height {
    var count = 0
    for i in 0..<N {
        for j in 0..<N {
            if newM[i][j] > h {
                dfs(i, j, h)
                count += 1
            }
        }
    }
    result.append(count)
    newM = M
}
print(result.max()!)