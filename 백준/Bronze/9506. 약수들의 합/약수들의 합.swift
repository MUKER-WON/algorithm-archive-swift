while true {
    let n = Int(readLine()!)!
    if n == -1 { break }
    let arr = (1..<n).filter { n%$0 == 0 }
    if arr.reduce(0,+) == n { print("\(n) = \(arr.map { String($0) }.joined(separator: " + "))") } else { print("\(n) is NOT perfect.") }
}