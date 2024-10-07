import Foundation

let n = Int(readLine()!)!
let average = Int(round(Double(n) * 0.15))
let arr = (0..<n).map { _ in Int(readLine()!)! }.sorted()
let level = (average..<n-average).map { arr[$0] }.reduce(0,+)
print(n == 0 ? 0 : Int(round(Double(level) / Double(n-average*2))))