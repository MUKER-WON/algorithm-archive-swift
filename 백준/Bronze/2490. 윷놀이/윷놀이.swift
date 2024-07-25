for _ in 0..<3 {
    let n = readLine()!.split(separator: " ").map { Int($0)! }.reduce(0,+)
    print(n>3 ? "E" : n>2 ? "A" : n>1 ? "B" : n>0 ? "C" : "D")
}