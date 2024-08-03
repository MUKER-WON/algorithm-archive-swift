while true {
    let n = readLine()!.split(separator: " ").map { Int($0)! }
    if n == [0,0] { break }
    switch n[0]%n[1] {
    case n[0]: print("factor")
    case 0: print("multiple")
    default: print("neither")
    }
}