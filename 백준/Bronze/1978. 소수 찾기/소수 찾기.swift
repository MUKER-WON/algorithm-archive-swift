let N = Int(readLine()!)!
let I = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
for i in 0..<N {
    guard I[i] != 1 else { continue }
    var count = 0
    for j in 1...I[i] {
        if I[i] % j == 0 { count += 1 }
    }
    if count == 2 { result += 1 }
}
print(result)