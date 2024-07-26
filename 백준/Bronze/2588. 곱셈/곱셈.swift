import Foundation

var input = Int(readLine()!)!
var input2 = Int(readLine()!)!

print(input * (input2 % 10))
print(input * ((input2 % 100) / 10))
print(input * (input2 / 100))
print(input * input2)
