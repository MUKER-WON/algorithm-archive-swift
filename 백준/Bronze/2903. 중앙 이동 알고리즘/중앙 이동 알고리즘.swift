import Foundation
var n = 2
for i in 0..<Int(readLine()!)! {
    n += Int(pow(2, Double(i)))
}
print(n*n)