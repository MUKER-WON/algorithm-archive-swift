let R = [(0,1),(0,-1),(1,0),(-1,0)]
let N = Int(readLine()!)!
let G = (0..<N).map { _ in
    readLine()!.map { String($0) }
}
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var rgVisited = visited
var ans = (0,0)

func dfs(_ y: Int, _ x: Int, _ blind: Bool) {
    if blind { rgVisited[y][x] = true }
    else { visited[y][x] = true }
    
    let color = G[y][x]
    
    for r in R {
        let (dy,dx) = (y+r.0,x+r.1)
        guard dy >= 0 && dx >= 0 && dy < N && dx < N else { continue }
        if blind && !rgVisited[dy][dx] {
            if color == "B" && G[dy][dx] == "B" {
                dfs(dy,dx,true)
            } else if color != "B" && G[dy][dx] != "B" {
                dfs(dy,dx,true)
            }
        } else if !blind {
            if !visited[dy][dx] && color == G[dy][dx] {
                dfs(dy,dx,false)
            }
        }
    }
}
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            dfs(i,j,false)
            ans.0 += 1
        }
        if !rgVisited[i][j] {
            dfs(i,j,true)
            ans.1 += 1
        }
    }
}
print("\(ans.0) \(ans.1)")