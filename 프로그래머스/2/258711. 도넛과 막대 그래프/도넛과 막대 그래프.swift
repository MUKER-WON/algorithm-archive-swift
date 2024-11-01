func solution(_ edges:[[Int]]) -> [Int] {
    var outGraph = [Int: [Int]]()
    var inGraph = [Int: [Int]]()
    var start = (node: 0, count: 0)
    var ans = [0,0,0,0]
    var maxNum = 0
    
    // graph 초기화
    for edge in edges {
        maxNum = max(maxNum, edge[0], edge[1])
        outGraph[edge[0], default: []].append(edge[1])
        inGraph[edge[1], default: []].append(edge[0])
    }
    
    // 시작 정점 찾기
    for i in 1...maxNum {
        if inGraph[i, default: []].isEmpty && outGraph[i, default: []].count >= 2 {
            start = (i, outGraph[i, default: []].count)
            break
        }
    }
    ans[0] = start.node
    
    // 그래프 찾기
    for node in outGraph[start.node, default: []] {
        var stack = [node]
        var edge = 0
        var vertex = 0
        var visited = Set<Int>()
        
        while !stack.isEmpty {
            let n = stack.popLast()!
            guard !visited.contains(n) else { continue }
            visited.insert(n)
            vertex += 1
            for nextNode in outGraph[n, default: []] {
                edge += 1
                if !visited.contains(nextNode) {
                    stack.append(nextNode)
                }
            }
        }
        
        if edge == vertex {
            ans[1] += 1  // 도넛 모양
        } else if edge == vertex - 1 {
            ans[2] += 1  // 막대 모양
        } else {
            ans[3] += 1  // 8자 모양
        }
    }
    
    return ans
}