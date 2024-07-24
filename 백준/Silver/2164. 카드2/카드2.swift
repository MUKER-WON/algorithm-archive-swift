import Foundation

let N = Int(readLine()!)!

var card: [Int?] = (1...N).map { $0 }
var head = 0

while true {
    guard card.count != 1 else { print(1); break}
    card[head] = nil
    if card[card.count-2] == nil { print(card[card.count-1]!); break }
    card.append(card[head+1])
    card[head+1] = nil
    head += 2
}