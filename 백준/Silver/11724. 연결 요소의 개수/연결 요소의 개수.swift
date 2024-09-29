let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var arr = Array(repeating: [Int](), count: N+1)
var visited = [Bool](repeating: false, count: N+1)
var count = 0
for _ in 0..<M {
    let i = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i[0]].append(i[1])
    arr[i[1]].append(i[0])
}
func dfs(_ n:Int) {
    visited[n] = true
    for i in arr[n] {
        if !visited[i] {
            dfs(i)
        }
    }
}
for i in 1...N {
    if !visited[i] {
        dfs(i)
        count+=1
    }
}
print(count)