let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
var list = Array(repeating: 0, count: 101)

for _ in 0..<N+M {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    list[I[0]] = I[1]
}

var queue = [(1,0)]
var ans = 20
var visited = Array(repeating: false, count: 101)
visited[1] = true

while !queue.isEmpty {
    let n = queue.removeFirst()
    
    if n.1 >= ans { continue }
    if n.0 >= 100 {
        ans = min(ans, n.1)
        continue
    }
    
    for i in 1...6 {
        let nn = n.0+i
        
        guard nn <= 100, !visited[nn] else { continue }
        visited[nn] = true
        
        if list[nn] != 0 {
            queue.append((list[nn], n.1+1))
        } else if i == 100 {
            queue.append((nn, n.1+1))
        } else {
            queue.append((nn, n.1+1))
        }
    }
}

print(ans)