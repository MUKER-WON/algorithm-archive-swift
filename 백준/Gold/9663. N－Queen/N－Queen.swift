let N = Int(readLine()!)!

var visited1 = Array(repeating: false, count: N)
var visited2 = visited1 + visited1
var visited3 = visited2
var ans = 0

/// y: 행의 위치
func task(_ y: Int) {
    if y == N {
        ans += 1
        return
    }
    for x in 0..<N {
        let c = [x, x+y, x-y+N-1]
        
        if !visited1[c[0]] && !visited2[c[1]] && !visited3[c[2]] {
            (visited1[c[0]], visited2[c[1]], visited3[c[2]]) = (true, true, true)
            task(y+1)
            (visited1[c[0]], visited2[c[1]], visited3[c[2]]) = (false, false, false)
        }
    }
}

task(0)
print(ans)