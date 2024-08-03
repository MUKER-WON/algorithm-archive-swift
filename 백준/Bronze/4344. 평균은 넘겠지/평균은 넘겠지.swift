import Foundation
let input = Int(readLine()!)!
for _ in 1...input {
    var input2 = readLine()!.split(separator: " ").map { Int($0)! }
    var over = 0
    var avg = 0
    let count = input2[0]
    input2.remove(at: 0)
    for i in input2 {
        avg += i
    }
    avg = avg / count
    for i in input2 {
        if i > avg {
            over += 1
        }
    }
    print("\(String(format: "%.3f", Double(over) / Double(count) * 100))%")
}
