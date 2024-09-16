let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var stack = [Int]()
var result = Array(repeating: 0, count: N)
for i in (0..<N).reversed() {
    while !stack.isEmpty && stack.last! <= arr[i] { stack.removeLast() }
    stack.isEmpty ? (result[i] = -1) : (result[i] = stack.last!)
    stack.append(arr[i])
}
print(result.map { String($0) }.joined(separator: " "))