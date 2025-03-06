import Foundation

let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,K) = (I[0], I[1])
var queue = [(N,0)]
var visited = Array(repeating: false, count: 100001)
visited[N] = true

var idx = 0
while idx < queue.count {
    let (n,c) = queue[idx]
    idx += 1
    
    if n == K {
        print(c)
        break
    }
    
    var temp = n
    
    while (1...100000).contains(temp) {
        temp *= 2
        if 100000 >= temp, !visited[temp] {
            queue.append((temp,c))
            visited[temp] = true
        }
    }
    
    let D = [-1,1]
    
    for d in D {
        let dx = n+d
        if (0...100000).contains(dx) && !visited[dx] {
            queue.append((dx,c+1))
            visited[dx] = true
        }
    }
}