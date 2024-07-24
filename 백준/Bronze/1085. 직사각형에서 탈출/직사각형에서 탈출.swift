let input = readLine()!.split(separator: " ").map { Int($0)! }
var a = input[0] < input[2]-input[0] ? input[0] : input[2]-input[0]
var b = input[1] < input[3]-input[1] ? input[1] : input[3]-input[1]
a > b ? print(b) : print(a)