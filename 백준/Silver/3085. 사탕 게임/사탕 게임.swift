let D = [(0,1),(0,-1),(1,0),(-1,0)]
let N = Int(readLine()!)!
let G = (0..<N).map { _ in
    readLine()!.map { String($0) }
}
var ans = 0

func C(_ arr: [String]) -> Int {
    var (maxCnt, now) = (0,1)
    for i in 1..<N {
        if arr[i] == arr[i-1] { now += 1 }
        else { maxCnt = max(maxCnt, now); now = 1 }
    }
    return max(maxCnt, now)
}

for y in 0..<N {
    ans = max(ans, [C(G[y]), C((0..<N).map { G[y][$0] })].max()!)
    for x in 0..<N {
        let (cY,cX) = (y+1,x+1)
        if cY < N && G[y][x] != G[cY][x] {
            var G = G
            (G[y][x],G[cY][x]) = (G[cY][x],G[y][x])
            ans = max(ans, [C(G[y]), C(G[cY]), C((0..<N).map { G[$0][x] })].max()!)
        }
        if cX < N && G[y][x] != G[y][cX] {
            var G = G
            (G[y][x],G[y][cX]) = (G[y][cX],G[y][x])
            ans = max(ans, [C(G[y]), C((0..<N).map { G[$0][cX] }), C((0..<N).map { G[$0][x] })].max()!)
        }
    }
}
print(ans)