let D = [(0,0,1),(0,0,-1),(0,1,0),(0,-1,0),(1,0,0),(-1,0,0)]
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (M,N,H) = (I[0],I[1],I[2])
var queue = [(Int,Int,Int,Int)]()
var ans = 0
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: H)
var tomato = (0..<H).map { i in
    (0..<N).map { j -> [Int] in
        let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
        for k in (0..<M) {
            if arr[k] == 1 {
                queue.append((i,j,k,0))
                visited[i][j][k] = true
            }
        }
        return arr
    }
}

var index = 0
while index < queue.count {
    let n = queue[index]
    index += 1
    ans = max(ans, n.3)
    for i in D {
        let (dh,dy,dx) = (n.0+i.0, n.1+i.1, n.2+i.2)
        guard dh >= 0 && dh < H && dy >= 0 && dy < N && dx >= 0 && dx < M && tomato[dh][dy][dx] == 0 && !visited[dh][dy][dx] else { continue }
        queue.append((dh,dy,dx,n.3+1))
        tomato[dh][dy][dx] = 1
        visited[dh][dy][dx] = true
    }
}

print(tomato.flatMap { $0 }.flatMap { $0 }.contains(0) ? -1 : ans)