for i in 1...Int(readLine()!)! {
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    arr.removeFirst()
    var result = 0
    for j in 0..<20 {
        result += arr[j..<20].filter { arr[j] > $0 }.count
    }
    print("\(i) \(result)")
}