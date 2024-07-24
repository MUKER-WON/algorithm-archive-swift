let input = Double(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Double($0)! }
var sum: Double = 0
let high = arr.max()!
let result = arr.map { $0 / high * 100 }
for i in result {
    sum += i
}
print(sum / input)