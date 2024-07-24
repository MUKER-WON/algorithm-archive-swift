import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var dictionary: [Int: [Int]] = [:]
    var visited = Array(repeating: false, count: n+1)
    var result = Int.max
    
    wires.forEach {
        dictionary[$0[0], default: []].append($0[1])
        dictionary[$0[1], default: []].append($0[0])
    }
    
    func bfs(_ num: Int) -> Int {
        var count = 0
        var queue = [Int]()
        
        queue = [num]
        visited[num] = true
        while !queue.isEmpty {
            let key = queue.removeFirst()
            count += 1
            for i in dictionary[key]! {
                if !visited[i] {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
        return count
    }
    
    for i in 1...n {
        visited = Array(repeating: false, count: n+1)
        visited[i] = true
        let count = bfs(1)
        result = min(result, abs(count-(n-count)))
    }
    
    return result
}
