var input = readLine()!.split(separator: " ").map { Int($0)! }
var input2 = Int(readLine()!)!

var temp = input[1] + input2

print((input[0] + temp / 60) % 24, temp % 60)
