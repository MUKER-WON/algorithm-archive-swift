func solution(_ numbers:[Int]) -> [Int] {
    var stack = [Int]()
    var result = Array(repeating: 0, count: numbers.count)
    for i in (0..<numbers.count).reversed() {
        while !stack.isEmpty && stack.last! <= numbers[i] { stack.removeLast() }
        stack.isEmpty ? (result[i] = -1) : (result[i] = stack.last!)
        stack.append(numbers[i])
    }
    return result
}