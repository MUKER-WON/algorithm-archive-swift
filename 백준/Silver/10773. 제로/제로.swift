let input = Int(readLine()!)!
var stack = [Int]()
for _ in 0..<input {
    let say = Int(readLine()!)!
    guard say != 0 else { stack.removeLast(); continue }
    stack.append(say)
}
print(stack.reduce(0,+))