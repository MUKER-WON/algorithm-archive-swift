let N = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N+1)
var ans = Array(repeating: 0, count: N+1)

for _ in 1..<N {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    arr[I[0]].append(I[1])
    arr[I[1]].append(I[0])
}

func dfs(_ parent: Int) {
    for child in arr[parent] {
        if child == parent || ans[child] != 0 { continue }
        ans[child] = parent
        dfs(child)
    }
}

dfs(1)
ans[2...].forEach { print($0) }