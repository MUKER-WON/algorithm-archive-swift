let N = Int(readLine()!)!

if N <= 99 {
    print(N)
} else {
    var result = 99
    for i in 100...N {
        var arr = Set<Int>()
        let n = String(i).map { Int(String($0))! }
        for j in 1..<n.count {
            arr.insert(n[j] - n[j-1]) 
        }
        if arr.count == 1 { result += 1 }
    }
    print(result)
}