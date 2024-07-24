let input = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array((1...input[0]))
var result = [Int]()
var count = 0

while !arr.isEmpty {
    count += input[1]-1
    count = count % arr.count
    result.append(arr.remove(at: count))
}

print("<\(result[0])",terminator: "")
(1..<result.count).forEach { print(", \(result[$0])",terminator: "")}
print(">")