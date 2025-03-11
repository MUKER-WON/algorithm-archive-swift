import Foundation

let I = readLine()!.split(separator: " ").map { Int($0)! }
let (R, C) = (I[0], I[1])
var board = (0..<R).map { _ in
    readLine()!.map { Int($0.asciiValue!) - 65 }
}
let D = [(0,1),(0,-1),(1,0),(-1,0)]
var ans = 1

func dfs(n: (Int, Int), visited: Int, cnt: Int) {
    ans = max(ans, cnt)
    
    if cnt == 26 {
        ans = 26
        return
    }
    
    for d in D {
        let (ny, nx) = (n.0+d.0, n.1+d.1)
        guard ny >= 0 && ny < R && nx >= 0 && nx < C else { continue }
        
        let nextChar = board[ny][nx]
        if (visited & (1 << nextChar)) == 0 {
            dfs(n: (ny, nx),
                visited: visited | (1 << nextChar),
                cnt: cnt + 1
            )
        }
    }
}

dfs(n: (0,0), visited: 1 << board[0][0], cnt: 1)
print(ans)