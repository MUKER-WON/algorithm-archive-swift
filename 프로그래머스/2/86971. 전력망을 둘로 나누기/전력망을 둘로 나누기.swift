func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var ans = Int.max

    for i in 0..<wires.count {
        var dic = [Int: [Int]]()
        var visited = Array(repeating: false, count: n+1)
        
        wires.enumerated().forEach { index, wire in
            if index != i {
                dic[wire[0], default: [Int]()].append(wire[1])
                dic[wire[1], default: [Int]()].append(wire[0])
            }
        }
        
        var stack = [1]
        visited[1] = true
        var cnt = 1
        
        while !stack.isEmpty {
            let n = stack.removeLast()
            
            dic[n]?.forEach { value in
                if !visited[value] {
                    visited[value] = true
                    stack.append(value)
                    cnt += 1
                }
            }
        }
        
        let now = abs((n-cnt) - cnt)
        ans = min(ans, now)
    }
    
    return ans
}