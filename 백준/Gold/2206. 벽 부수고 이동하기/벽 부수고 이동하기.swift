let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
let G = (0..<N).map { _ in readLine()!.map { Int(String($0))! } }
let D = [(0,1),(0,-1),(1,0),(-1,0)]
var visited = Array(repeating: Array(repeating: [false, false], count: M), count: N)
var queue = [(0,0,1,0)]
var ans = Int.max
var idx = 0
visited[0][0][0] = true
while idx < queue.count {
    let n = queue[idx]
    idx += 1
    guard n.2 < ans else { break }
    if (n.0, n.1) == (N-1, M-1) {
        ans = min(ans, n.2)
        break
    }
    for d in D {
        let (ny, nx) = (n.0+d.0, n.1+d.1)
        guard ny >= 0 && ny < N && nx >= 0 && nx < M else { continue }
        
        if G[ny][nx] == 1 && n.3 == 0 && !visited[ny][nx][1] {
            visited[ny][nx][1] = true
            queue.append((ny,nx,n.2+1,1))
        }
        if G[ny][nx] == 0 && !visited[ny][nx][n.3] {
            visited[ny][nx][n.3] = true
            queue.append((ny,nx,n.2+1,n.3))
        }
    }
}
print(ans == Int.max ? -1 : ans)