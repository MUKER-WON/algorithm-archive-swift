func failureFunc(_ s: String) -> [Int] {
    let arr = Array(s)
    var f = [Int](repeating: 0, count: s.count)
    var j = 0
    
    for i in 1..<s.count {
        while j > 0 && arr[i] != arr[j] { j = f[j-1] }
        if arr[i] == arr[j] { j += 1; f[i] = j }
    }
    
    return f
}

let S = readLine()!, P = readLine()!
let (sArr, pArr) = (Array(S), Array(P))
let failure = failureFunc(P)
var j = 0
var ans = 0

for i in 0..<S.count {
    while j > 0 && sArr[i] != pArr[j] {
        j = failure[j-1]
    }
    if sArr[i] == pArr[j] {
        j += 1
    }
    if j == pArr.count {
        ans = 1
        break
    }
}

print(ans)