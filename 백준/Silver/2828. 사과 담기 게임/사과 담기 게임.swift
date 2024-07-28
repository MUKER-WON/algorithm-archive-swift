let input = readLine()!.split(separator: " ").map { Int($0)! }
let appleNumber = Int(readLine()!)!
let appleLocation = (0..<appleNumber).map { _ in Int(readLine()!)! }
var basket = (1...input[1]).map { $0 }
var move = 0
for i in appleLocation {
    guard !basket.contains(i) else { continue }
    if basket[basket.endIndex-1] < i {
        let distance = i - basket[basket.endIndex-1]
        basket = basket.map { $0 + distance }
        move += distance
        continue
    } else {
        let distance = basket[basket.startIndex] - i
        basket = basket.map { $0 - distance }
        move += distance
        continue
    }
}
print(move)