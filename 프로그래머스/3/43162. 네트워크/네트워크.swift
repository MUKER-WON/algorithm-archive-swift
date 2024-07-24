var computer = [[Int]]()
var visited = [Bool]()

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    computer = computers
    visited = Array(repeating: false, count: n)
    var answer = 0
    for i in 0..<n {
        if !visited[i] {
            dfs(i)
            answer += 1
        }
    }
    return answer
}

func dfs(_ now: Int) {
    if visited[now] { return }
    visited[now] = true
    for i in 0..<computer.count {
        if computer[now][i] == 1 { dfs(i) }
    }
}