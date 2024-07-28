import Foundation

var input = readLine()!
let temp = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

for i in temp {
    input = input.replacingOccurrences(of: i, with: "*")
}

print(input.count)