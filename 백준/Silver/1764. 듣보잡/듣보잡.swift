let input = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Set<String>()
var result = [String]()
for _ in 0..<input[0] {
    arr.update(with: readLine()!)
}
for _ in 0..<input[1] {
    let name = readLine()!
    if arr.contains(name) {
        result.append(name)
    }
}
print(result.count)
for i in result.sorted() { print(i) }