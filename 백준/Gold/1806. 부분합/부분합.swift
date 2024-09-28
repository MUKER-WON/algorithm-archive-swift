let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, S) = (I[0], I[1])
let A = readLine()!.split { $0 == " " }.map { Int($0)! }
var (p1, p2) = (0,0)
var sum = 0
var ans = Int.max

while true {
    if sum >= S {
        ans = min(ans, p2-p1)
        sum -= A[p1]
        p1 += 1
    } else {
        if p2 == N { break }
        sum += A[p2]
        p2 += 1
    }
}

print(ans == Int.max ? 0 : ans)
