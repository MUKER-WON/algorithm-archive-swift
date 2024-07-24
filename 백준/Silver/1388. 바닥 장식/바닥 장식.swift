let NM = readLine()!.split {$0 == " "}.map {Int($0)!}, N = NM[0], M = NM[1]
let arr = (0..<N).map { _ in Array(readLine()!) }
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var result = 0

for i in 0..<N {
    for j in 0..<M {
        guard !visited[i][j] else { continue }
        var d = 1
        visited[i][j] = true
        result += 1
        if arr[i][j] == "-" {
            while j+d < M && arr[i][j+d] == "-" {
                visited[i][j+d] = true
                d += 1
            }
        } else {
            while i+d < N && arr[i+d][j] == "|" {
                visited[i+d][j] = true
                d += 1
            }
        }
    }
}
print(result)