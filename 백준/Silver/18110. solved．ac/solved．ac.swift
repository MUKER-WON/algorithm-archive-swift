import Foundation
let n = Int(readLine()!)!
let div = Int(round(Double(n) * 0.15))
let arr = (0..<n).map { _ in Int(readLine()!)! }.sorted()
let avg = (div..<n-div).map { arr[$0] }.reduce(0,+)
print(n == 0 ? 0 : Int(round(Double(avg) / Double(n-div*2))))