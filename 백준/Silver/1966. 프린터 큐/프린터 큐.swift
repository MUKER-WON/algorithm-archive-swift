let count = Int(readLine()!)!
for _ in 0..<count {
    var result = 1
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var arr = Array(readLine()!.split(separator: " ").map { Int($0)! }.enumerated())
    while true {
        if arr[0].element == arr.max(by: { $0.element < $1.element })!.element {
            if arr[0].offset == input[1] { print(result); break }
            arr.removeFirst()
            result += 1
        } else {
            arr.append(arr.first!)
            arr.removeFirst()
        }
    }
}