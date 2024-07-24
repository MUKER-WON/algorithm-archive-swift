var input = Int(readLine()!)!

for _ in 1...input {
    let input2 = readLine()!
    var arr = [Character]()
    
    for i in input2 {
        if !arr.contains(i) {
            arr.append(i)
        } else if arr.last! != i {
            input -= 1
            break
        }
    }
}
print(input)