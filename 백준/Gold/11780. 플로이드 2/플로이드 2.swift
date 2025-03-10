let n = Int(readLine()!)!
let m = Int(readLine()!)!
let INF = Int(1e9)
var arr = Array(repeating: Array(repeating: INF, count: n), count: n)
var next = arr
for i in 0..<n { arr[i][i] = 0 }

for _ in 0..<m {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (i,j,c) = (I[0]-1,I[1]-1,I[2])
    arr[i][j] = min(arr[i][j],c)
    next[i][j] = j
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n where arr[i][j] > arr[i][k]+arr[k][j] {
            arr[i][j] = arr[i][k]+arr[k][j]
            next[i][j] = next[i][k]
        }
    }
}

func trace(_ st: Int, _ end: Int) -> [Int] {
    var arr = [st+1]
    var now = st
    while now != end {
        now = next[now][end]
        arr.append(now+1)
    }
    return arr
}

arr.forEach { print($0.map { $0 == INF ? "0" : String($0) }.joined(separator: " ")) }

(0..<n).forEach { i in
    (0..<n).forEach { j in
        if next[i][j] == INF { print(0); return }
        let path = trace(i, j)
        print(path.count, path.map { String($0) }.joined(separator: " "))
    }
}