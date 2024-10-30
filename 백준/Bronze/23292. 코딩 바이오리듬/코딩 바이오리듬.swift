let B = readLine()!.map { Int(String($0))! }
var max = 0
var ans = ""
for _ in 0..<Int(readLine()!)! {
    let D = readLine()!.map { Int(String($0))! }
    let bio = (0...7).map { (B[$0]-D[$0])*(B[$0]-D[$0]) }
    let val = bio[0...3].reduce(0,+) * bio[4...5].reduce(0,+) * bio[6...7].reduce(0,+)
    if max <= val {
        let date = D.map { String($0) }.joined()
        if max == val && date > ans { continue }
        max = val
        ans = date
    }
}
print(ans)