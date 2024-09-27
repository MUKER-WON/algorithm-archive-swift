let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (I[0],I[1])
let A = (0..<N).map { _ in Int(readLine()!)! }.sorted()
var (p1, p2) = (0,0)
var ans = Int.max

while p1 < N && p2 < N {
    let n = A[p2] - A[p1]
    if n >= M {
        ans = min(n, ans)
        p1 += 1
    } else {
        p2 += 1
    }
}

print(ans)
