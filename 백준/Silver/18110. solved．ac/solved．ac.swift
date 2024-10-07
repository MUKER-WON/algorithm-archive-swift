import Foundation
let n = Int(readLine()!)!
let div = Int(round(Double(n) * 0.15))
let arr = (0..<n).map { _ in Int(readLine()!)! }.sorted()
print(n == 0 ? 0 : Int(round(Double(arr[div..<n-div].reduce(0,+)) / Double(n-div*2))))
