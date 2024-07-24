let NMV = readLine()!.split(separator: " ").map { Int($0)! }
let (N,M,V) = (NMV[0],NMV[1],NMV[2])
var graph = [Int: [Int]]()
var visited = Array(repeating: false, count: N+1)
var (dfs,bfs) = ([Int](),[Int]())

for _ in 0..<M {
    let road = readLine()!.split(separator: " ").map { Int($0)! }
    graph[road[0]] = (graph[road[0]] ?? []) + [road[1]]
    graph[road[1]] = (graph[road[1]] ?? []) + [road[0]]
}

func DFS(_ n: Int) {
    visited[n] = true
    print(n,terminator: " ")
    dfs.append(n)
    guard graph.keys.contains(n) else { return }
    for i in graph[n]!.sorted(by: <) {
        if visited[i] == false {
            DFS(i)
        }
    }
}

func BFS(_ n: Int) {
    var queue = [Int]()
    queue.append(n)
    visited[n] = false
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        visited[pop] = false
        print(pop,terminator: " ")
        guard graph.keys.contains(n) else { return }
        for i in graph[pop]!.sorted(by: <) {
            if visited[i] == true && !queue.contains(i) {
                queue.append(i)
            }
        }
    }
    
}

DFS(V)
print("")
BFS(V)