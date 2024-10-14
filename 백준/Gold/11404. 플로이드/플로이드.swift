let n = Int(readLine()!)!
let m = Int(readLine()!)!
let INF = Int(1e9)
var arr = Array(repeating: Array(repeating: INF, count: n), count: n)
for i in 0..<n { arr[i][i] = 0 }

for _ in 0..<m {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    arr[I[0]-1][I[1]-1] = min(arr[I[0]-1][I[1]-1], I[2])
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            arr[i][j] = min(arr[i][j], arr[i][k] + arr[k][j])
        }
    }
}

arr.forEach {
    print($0.map { $0 == INF ? "0" : String($0) }.joined(separator: " "))
}