let N = Int(readLine()!)!
let card = Set(readLine()!.split(separator: " ").map { Int($0)! })
let M = Int(readLine()!)!
let verify = readLine()!.split(separator: " ").map { Int($0)! }

for i in verify {
    print(card.contains(i) ? "1" : "0", terminator: " ")
}