struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }
    
    let node: Int
    let cost: Int
}

class PriorityQueue {
    var heap = [Node]()
    
    var isEmpty: Bool { heap.isEmpty }
    
    func insert(_ value: Node) {
        heap.append(value)
        var idx = heap.count - 1
        
        while idx > 0 {
            let parent = (idx - 1) / 2
            if heap[parent] <= heap[idx] { break }
            heap.swapAt(parent, idx)
            idx = parent
        }
    }
    
    func pop() -> Node? {
        guard !heap.isEmpty else { return nil }  // 안전하게 처리
        
        let result = heap[0]
        if heap.count == 1 {
            heap.removeLast()  // 남은 원소가 1개일 때 처리
            return result
        }
        
        heap[0] = heap.removeLast()
        var idx = 0
        
        while idx < heap.count {
            let left = 2 * idx + 1
            let right = 2 * idx + 2
            var minIdx = idx
            
            if left < heap.count && heap[left] < heap[minIdx] {
                minIdx = left
            }
            if right < heap.count && heap[right] < heap[minIdx] {
                minIdx = right
            }
            if minIdx == idx { break }
            
            heap.swapAt(idx, minIdx)
            idx = minIdx
        }
        return result
    }
}

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (V, E) = (input[0], input[1])
let K = Int(readLine()!)!

var graph = [[Node]](repeating: [], count: V + 1)
var distants = [Int](repeating: Int.max, count: V + 1)

for _ in 0..<E {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (start, end, cost) = (input[0], input[1], input[2])
    graph[start].append(Node(node: end, cost: cost))
}

func dijkstra(node: Int) {
    let queue = PriorityQueue()
    
    distants[node] = 0
    queue.insert(Node(node: node, cost: 0))
    
    while !queue.isEmpty {
        guard let now = queue.pop() else { break }
        
        if distants[now.node] < now.cost { continue }
        
        for next in graph[now.node] {
            let cost = next.cost + now.cost
            
            if cost < distants[next.node] {
                distants[next.node] = cost
                queue.insert(Node(node: next.node, cost: cost))
            }
        }
    }
}

dijkstra(node: K)

for i in 1...V {
    distants[i] == Int.max
    ? print("INF")
    : print(distants[i])
}