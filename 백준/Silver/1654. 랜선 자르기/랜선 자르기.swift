let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (K, N) = (I[0], I[1])
let arr = (0..<K).map { _ in Int(readLine()!)! }
var (st, en) = (1, arr.max()!)

while st <= en {
    var cnt = 0
    let mid = (st + en) / 2
    for i in arr { cnt += (i / mid) }
    if cnt < N { en = mid - 1 }
    else { st = mid + 1 }
}

print(en)
