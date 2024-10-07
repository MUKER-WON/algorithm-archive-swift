let direction = [(1,0),(-1,0),(0,1),(0,-1),(-1,-1),(1,1),(-1,1),(1,-1)]

while true {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    if I == [0,0] { break }
    let (w,h) = (I[0],I[1])
    var ans = 0
    var graph = (0..<h).map { _ in
        readLine()!.split { $0 == " " }.map { Int($0)! }
    }
    
    for y in 0..<h {
        for x in 0..<w {
            if graph[y][x] == 0 { continue }
            dfs(y,x)
            ans += 1
        }
    }
    
    func dfs(_ y: Int, _ x: Int) {
        graph[y][x] = 0
        for d in direction {
            let (dy,dx) = (y+d.0,x+d.1)
            guard dy >= 0 && dy < h && dx >= 0 && dx < w else { continue }
            if graph[dy][dx] == 1 {
                dfs(dy, dx)
            }
        }
    }
    print(ans)
}