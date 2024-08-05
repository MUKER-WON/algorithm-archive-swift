import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }

print((input[0] + input[1]) % input[2])
print(((input[0] % input[2]) + (input[1] % input[2])) % input[2])
print((input[0] * input[1]) % input[2])
print(((input[0] % input[2]) * (input[1] % input[2])) % input[2])