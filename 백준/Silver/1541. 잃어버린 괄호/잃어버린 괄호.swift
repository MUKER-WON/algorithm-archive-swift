let input = readLine()!.split(separator: "-")
var a = input.map { $0.split(separator: "+").map { Int($0)! }.reduce(0,+) }
let firstNum = a[0]
print(a.reduce(firstNum*2, -))
