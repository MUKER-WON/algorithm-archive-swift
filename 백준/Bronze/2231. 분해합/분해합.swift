var input = readLine()!
var num = Int(input)!
var figure = input.map { $0 }.count * 9
var start = num-figure >= 0 ? num-figure : 0
var result = 0
for i in start...num {
    let temp = i
    let sum = String(temp).map { Int(String($0))! }.reduce(0,+) + temp
    if sum == num {
        result = temp
        break
    }
}
print(result)