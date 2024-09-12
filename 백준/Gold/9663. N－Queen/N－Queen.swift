let N = Int(readLine()!)!
var V1 = Array(repeating: false, count: N)
var V2 = V1 + V1
var V3 = V2
var ans = 0
func task(_ y: Int) {
    if y == N {
        ans += 1
        return
    }
    for x in 0..<N {
        let c = [x, x+y, x-y+N-1]
        if !V1[c[0]] && !V2[c[1]] && !V3[c[2]] {
            (V1[c[0]], V2[c[1]], V3[c[2]]) = (true, true, true)
            task(y+1)
            (V1[c[0]], V2[c[1]], V3[c[2]]) = (false, false, false)
        }
    }
}
task(0)
print(ans)