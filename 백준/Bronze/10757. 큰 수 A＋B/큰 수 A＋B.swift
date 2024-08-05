let input = readLine()!.split(separator: " ")
let maxCount = max(input[0].count, input[1].count)
var a = Array(repeating: 0, count: maxCount)
var b = Array(repeating: 0, count: maxCount)
var result = Array(repeating: 0, count: maxCount)
for (index,i) in input[0].reversed().enumerated() {
    a[maxCount - (index+1)] = Int(String(i))!
}
for (index,i) in input[1].reversed().enumerated() {
    b[maxCount - (index+1)] = Int(String(i))!
}
for i in (0..<maxCount).reversed() {
    let sum = a[i] + b[i]
    if i == 0 { result[i] += sum }
    else {
        result[i-1] = (result[i]+sum) / 10
        result[i] = (result[i]+sum) % 10
    }
}
print(result.map { String($0) }.joined())