let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (H,W) = (I[0], I[1])
let block = readLine()!.split { $0 == " " }.map { Int($0)! }
var ans = 0

for h in 0..<H {
    var left = false
    var hole = 0
    for w in 0..<W {
        if block[w] - h > 0 {
            if left {
                ans += hole
                hole = 0
            } else {
                left = true
            }
        } else {
            if left {
                hole += 1
            }
        }
    }
}

print(ans)