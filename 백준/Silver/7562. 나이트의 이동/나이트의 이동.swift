let dy = [1,2,2,1,-1,-2,-2,-1]
let dx = [-2,-1,1,2,2,1,-1,-2]

for _ in 0..<Int(readLine()!)! {
    let length = Int(readLine()!)!
    let S = readLine()!.split { $0 == " " }.map { Int($0)! }
    let G = readLine()!.split { $0 == " " }.map { Int($0)! }
    var queue = [(S,0)]
    var visited = Array(repeating: Array(repeating: false, count: length), count: length)
    visited[S[0]][S[1]] = true
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        if current.0 == G {
            print(current.1)
            break
        }
        for i in 0..<dy.count {
            let my = current.0[0] + dy[i]
            let mx = current.0[1] + dx[i]
            
            guard my >= 0 && my < length && mx >= 0 && mx < length && !visited[my][mx] else { continue }
            visited[my][mx] = true
            queue.append(([my,mx],current.1+1))
        }
    }
}