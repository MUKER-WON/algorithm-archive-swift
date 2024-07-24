import Foundation
let T = Int(readLine()!)!
var A = [Int]()
var D = [Int: Int]()
var A2 = [Int]()
for _ in 1...T {
    A.append(Int(readLine()!)!)
}
for i in A {
    if D[i] == nil {
        D[i] = 1
    } else {
        D[i]! += 1
    }
}
for i in D.keys {
    if D[i] == D.values.max() {
        A2.append(i)
    }
}
print(Int(round(Double(A.reduce(0) { $0 + $1 }) / Double(T))))
print(A.sorted()[T/2])
print(A2.count > 1 ? A2.sorted()[1] : A2[0])
print(A.max()! - A.min()!)