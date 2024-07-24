let numberCount = Int(readLine()!)!
let numberArray = readLine()!.split(separator: " ").map { Int(String($0))! }
let findIndex = Int(readLine()!)!

print(numberArray.filter { $0 == findIndex }.count)
