import Foundation

let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, L, R) = (I[0], I[1], I[2])
var list = (0..<N).map { _ in
    readLine()!.split { $0 == " " }.map { Int($0)! }
}
var ans = 0

func dfs(_ y: Int, _ x: Int, _ visited: inout [[Bool]], _ val: inout [(Int, Int, Int)]) {
    [(y,x+1), (y,x-1), (y+1,x), (y-1,x)].forEach { ny, nx in
        guard 0..<N ~= ny, 0..<N ~= nx, !visited[ny][nx] else { return }
        guard L...R ~= abs(list[y][x] - list[ny][nx]) else { return }
        
        visited[ny][nx] = true
        val.append((ny, nx, list[ny][nx]))
        dfs(ny, nx, &visited, &val)
    }
}

while true {
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var move = false
    
    for y in 0..<N {
        for x in 0..<N {
            guard !visited[y][x] else { continue }
            
            var val: [(Int, Int, Int)] = [(y, x, list[y][x])]
            visited[y][x] = true
            dfs(y, x, &visited, &val)
            
            if val.count > 1 {
                move = true
                let total = val.reduce(0) { $0 + $1.2 }
                let n = total / val.count
                
                val.forEach { (y, x, _) in
                    list[y][x] = n
                }
            }
        }
    }
    
    if !move { break }
    ans += 1
}

print(ans)