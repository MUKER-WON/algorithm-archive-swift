let I = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (I[0], I[1])
var parent = Array(0...N)
var rank = Array(repeating: 1, count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let command = input[0]
    let a = input[1]
    let b = input[2]
    
    if command == 0 {
        union(a, b)
    } else {
        print(isConnected(a, b) ? "YES" : "NO")
    }
}

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let (rootA, rootB) = (find(a), find(b))
    
    if rootA == rootB { return }
    
    if rank[rootA] > rank[rootB] {
        parent[rootB] = rootA
    } else if rank[rootA] < rank[rootB] {
        parent[rootA] = rootB
    } else {
        parent[rootB] = rootA
        rank[rootA] += 1
    }
}

func isConnected(_ a: Int, _ b: Int) -> Bool {
    return find(a) == find(b)
}