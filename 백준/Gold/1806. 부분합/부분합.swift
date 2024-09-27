let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, S) = (I[0], I[1])
var A = readLine()!.split { $0 == " " }.map { Int($0)! }
var p2 = 0
var sum = 0
var ans = Int.max

for p1 in 0..<N {
    while p2 < N && sum < S {
        sum += A[p2]
        p2 += 1
    }
    if sum >= S {
        ans = min(ans, p2 - p1)
    }
    sum -= A[p1]
}

print(ans == Int.max ? 0 : ans)
