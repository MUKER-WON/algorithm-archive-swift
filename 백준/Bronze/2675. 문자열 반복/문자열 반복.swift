let input = Int(readLine()!)!
for _ in 0..<input {
    let temp = readLine()!.split(separator: " ")
    print(String(temp[1]).reduce(""){ $0 + String(repeating: $1, count: Int(temp[0])!)})
}