let D = [(0,1),(0,-1),(-1,0),(1,0)]
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
var (N,M,C,B) = (I[0],I[1],0,0)
let graph = (0..<N).map { _ in
    readLine()!.split { $0 == " " }.map { Int($0)! }
}
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

func bfs(_ y : Int, _ x: Int) -> Int {
    var queue = [(y,x)]
    var cnt = 0
    visited[y][x] = true
    
    while !queue.isEmpty {
        let (cy,cx) = queue.popLast()!
        cnt += 1
        
        for i in D {
            let (dy, dx) = (cy+i.0, cx+i.1)
            guard dy >= 0 && dy < N && dx >= 0 && dx < M else { continue }
            guard !visited[dy][dx] && graph[dy][dx] == 1 else { continue }
            queue.append((dy, dx))
            visited[dy][dx] = true
        }
    }
    return cnt
}

for i in 0..<N {
    for j in 0..<M {
        if !visited[i][j] && graph[i][j] == 1 {
            C += 1
            B = max(B, bfs(i, j))
        }
    }
}

print(C)
print(B)