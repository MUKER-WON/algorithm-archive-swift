let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
var B = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var result = 0
for i in (0..<N) { result += A[i] * B[i] }
print(result)