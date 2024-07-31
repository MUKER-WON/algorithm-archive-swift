let (N,M) = (Int(readLine()!)!, Int(readLine()!)!)
var arr = readLine()!.split { $0 == " " }.map { Int($0)! }
    .sorted()
var (p1,p2,ans) = (0,N-1,0)

while p1 < p2 {
    let now = arr[p1] + arr[p2]
    if now == M {
        ans += 1
        p1 += 1
        p2 -= 1
        continue
    } else if now > M {
        p2 -= 1
        continue
    } else {
        p1 += 1
    }
}
print(ans)