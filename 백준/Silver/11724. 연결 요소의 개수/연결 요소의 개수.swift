let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
var graph = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)
var ans = 0

for _ in 0..<M {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    graph[I[0]].append(I[1])
    graph[I[1]].append(I[0])
}

func dfs(_ n: Int) {
    visited[n] = true
    for i in graph[n] where !visited[i] {
        dfs(i)
    }
}

for i in 1...N where !visited[i] {
    dfs(i)
    ans += 1
}

print(ans)