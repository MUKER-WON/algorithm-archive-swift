let input = Int(readLine()!)!
for _ in 1...input {
    let input1 = readLine()!.map { String($0) }
    var result = 0
    var temp = 0
    for i in input1 {
        if i == "O" {
            temp = temp + 1
            result += temp
        } else {
            temp = 0
        }
    }
    print(result)
}