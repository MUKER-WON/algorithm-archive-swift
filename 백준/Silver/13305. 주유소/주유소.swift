import Foundation

var cityCount = Int(readLine()!)!
var cityDistance = readLine()!.split(separator: " ").map { Int($0)! } // 3
var cityPrice = readLine()!.split(separator: " ").map { Int($0)! } // 4
cityPrice.removeLast()
var result = 0
var minPrice = 10000000000

for i in cityPrice.enumerated() {
    if i.element < minPrice {
        minPrice = i.element
        result += minPrice * cityDistance[i.offset]
    } else {
        result += minPrice * cityDistance[i.offset]
    }
}
print(result)