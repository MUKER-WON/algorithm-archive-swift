let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
var visited = Array(repeating: false, count: N+1)
var ans = ""

func task(_ s: String, _ count: Int) {
    if count == M {
        ans += s+"\n"
        return
    }
    for i in 1...N {
        if !visited[i] {
            visited[i] = true
            task(s+"\(i) ", count+1)
            visited[i] = false
        }
    }
}

task("", 0)
print(ans)