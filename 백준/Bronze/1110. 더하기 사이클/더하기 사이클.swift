let input = Int(readLine()!)!
var temp = input
var num = 0

repeat {
    let input1 = temp / 10
    let input2 = temp % 10
    temp = (input2 * 10) + ((input1 + input2) % 10)
    num += 1
} while input != temp

print(num)
