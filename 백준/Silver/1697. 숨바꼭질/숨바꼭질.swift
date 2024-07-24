let NK = readLine()!.split { $0 == " " }.map { Int($0)! }, N = NK[0], K = NK[1]
var queue = [(N,0)]
var visited = Array(repeating: false, count: 100001)

while !queue.isEmpty {
    let now = queue.removeFirst()
    
    if now.0 == K {
        print(now.1)
        break
    }
    
    [now.0+1, now.0-1, now.0*2].forEach {
        if $0 >= 0 && $0 <= 100000 && !visited[$0] {
            queue.append(($0,now.1+1))
            visited[$0] = true
        }
    }
}