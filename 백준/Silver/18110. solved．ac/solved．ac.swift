import Foundation
let n = Int(readLine()!)!
let avg = Int(round(Double(n) * 0.15))
let arr = (0..<n).map { _ in Int(readLine()!)! }.sorted()
let level = (avg..<n-avg).map { arr[$0] }.reduce(0,+)
print(n == 0 ? 0 : Int(round(Double(level) / Double(n-avg*2))))