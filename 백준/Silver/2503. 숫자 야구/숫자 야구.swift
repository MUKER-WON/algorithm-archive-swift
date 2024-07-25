var result = [[Character]]()
var arr = (1...9).map { String($0) }
let length = 3
var used = Array(repeating: false, count: arr.count)

func backTracking(_ s: String) {
    if s.count == length {
        result.append(s.map { $0 })
        return
    }
    for i in 0..<arr.count {
        if !used[i] {
            used[i] = true
            backTracking(s+arr[i])
            used[i] = false
        }
    }
}
backTracking("")

for _ in 0..<Int(readLine()!)! {
    let q = readLine()!.split { $0 == " "}.map { Int($0)! }
    let num = Array(String(q[0]))
    
    result = result.filter {
        var SB = (0,0)
        
        for i in 0..<3 {
            if $0[i] == num[i] { SB.0 += 1 }
            else if num.contains($0[i]) { SB.1 += 1 }
        }
        
        return SB == (q[1],q[2])
    }
    
}
print(result.count)