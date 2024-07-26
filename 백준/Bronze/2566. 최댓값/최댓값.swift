var max = 0
var num = "1 1"
for i in 1...9 {
    let n = readLine()!.split(separator: " ").map { Int($0)! }.enumerated().max { $0.element < $1.element }!
    if max < n.element {
        max = n.element
        num = "\(i) \(n.offset + 1)"
    }
}
print(max)
print(num)