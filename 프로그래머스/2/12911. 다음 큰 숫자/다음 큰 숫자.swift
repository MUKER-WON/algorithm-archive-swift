func solution(_ n:Int) -> Int {
    var num = n+1
    let binaryCount = String(n, radix: 2).filter { $0 == "1" }.count
    while true {
        let nextBinaryCount = String(num,radix: 2).filter { $0 == "1" }.count
        if binaryCount == nextBinaryCount { return num }
        num += 1
    }
}