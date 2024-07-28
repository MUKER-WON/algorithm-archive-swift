var input = readLine()!.split(separator: " ").map { Int($0)! }
var input1 = input[0]
var input2 = input[1]
             
input2 -= 45
if input2 < 0 {
    input1 -= 1
    input2 += 60
}
if input1 < 0 {
    input1 += 24
}

print(input1, input2)